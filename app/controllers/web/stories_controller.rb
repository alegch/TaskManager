class Web::StoriesController < Web::ApplicationController
  respond_to :html, :js
  before_filter :authenticate_user!

  def index
    @users = User.scoped
    @search = Story.ransack(params[:q])
    @stories = @search.result
    @search.build_sort if @search.sorts.empty?
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
    @users = User.scoped
  end

  def edit
    @story = Story.find(params[:id])
  end

  def create
    @user = current_user
    @story = @user.sender_stories.build(params[:story])

    if @story.save
      flash[:notice] = 'Story was created'
      redirect_to story_path(@story)
    else
      redirect_to new_story_path
    end
  end

  def update
    @story = Story.find(params[:id])

    if @story.update_attributes(params[:story])
      flash[:notice] = 'Story was updated'
      redirect_to story_path(@story)
    else
      render action: "edit"
    end
  end

  def update_state
    event = params[:event]
    @story = Story.find(params[:id])
    @story.fire_state_event(event)
    render layout: false
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    redirect_to stories_path
  end

end
