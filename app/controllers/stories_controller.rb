class StoriesController < ApplicationController
  respond_to :html, :js
  before_filter :authenticate_user!

  def index
    @stories = Story.all
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
    @story.send(event)
  end

end
