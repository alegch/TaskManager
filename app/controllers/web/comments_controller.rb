class Web::CommentsController < Web::ApplicationController
  respond_to :html, :js

  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.create(params[:comment])

    if @comment.save
      flash_success
      respond_with @comment
    else
      flash_error
      redirect_to new_comment_path
    end
  end

end
