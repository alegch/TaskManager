class CommentsController < ApplicationController
  respond_to :html, :js

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      flash[:notice] = 'Commment created'
      render :create #@comment
    else
      redirect_to new_comment_path
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end
end
