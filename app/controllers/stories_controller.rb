class StoriesController < ApplicationController
  respond_to :html, :js
  before_filter :authenticate_user!

  def index
    @users = User.all
    @selected_reciver_id = 0
    if params[:search]
      @selected_reciver_id = params[:search][:reciver_id].to_i
      @selected_state = params[:search][:state].to_s
    end
    @stories = Story.search_by_reciver_id_and_state(@selected_reciver_id, @selected_state)
  end

  def show
    @story = Story.find(params[:id])
    @comment = @story.comments.new
  end

  def new
    @story = Story.new
    @users = User.all
  end

  def edit
    @story = Story.find(params[:id])
  end

  def create
    @user = current_user
    @story = @user.sender_stories.new(params[:story])

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
    respond_with @story
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    redirect_to stories_path
  end

end
