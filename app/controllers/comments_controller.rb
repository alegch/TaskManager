class CommentsController < ApplicationController
  respond_to :html, :js

  def index
    @comments = Comment.scoped
  end

  def create
    @comment = Comment.new(params[:comment])

    unless  @comment.save
      redirect_to new_comment_path
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end
end
