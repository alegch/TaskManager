class Web::CommentsController < Web::ApplicationController
  respond_to :html, :js

  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.build(params[:comment])

    if @comment.save
      respond_with @comment
    else
      redirect_to new_comment_path
    end
  end

end
