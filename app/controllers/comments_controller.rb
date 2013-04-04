class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      respond_with @comment, notice: 'Comment created'
    else
      redirect_to new_comment_path
    end
  end

end
