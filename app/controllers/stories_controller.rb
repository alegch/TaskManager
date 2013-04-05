class StoriesController < ApplicationController
  respond_to :html, :js
  before_filter :authenticate_user!

  def index
    @users = User.all
    if params[:search]
      reciver_id = params[:search][:reciver_id].to_i
      @stories = Story.search_by_reciver_id(reciver_id)
    else
      @stories = Story.all
    end
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
      respond_with @story, notice: 'Story was created'
    else
      redirect_to new_story_path
    end
  end

  def update
    @story = Story.find(params[:id])

    if @story.update_attributes(params[:story])
      redirect_to @story, notice: 'Story was successfully updated'
    else
      render action: "edit"
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    redirect_to stories_url
  end

  def update_state
    event = params[:event]
    @story = Story.find(params[:id])
    @story.fire_state_event(event)
  end

end
