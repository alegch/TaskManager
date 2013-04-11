class Web::CommentsController < Web::ApplicationController
  respond_to :html, :js

  def create
    @comment = Comment.new(params[:comment])

    unless  @comment.save
      redirect_to new_comment_path
    end
  end

end
