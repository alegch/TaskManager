class CommentsController < ApplicationController
  respond_to :html, :js

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      flash[:notice] = 'Commment created'
      respond_with @comment
    else
      redirect_to new_comment_path
    end
  end

end
