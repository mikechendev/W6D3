class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comments_url(@comment)
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url
  end

  def index
    if params[:user_id]
      @comments = Comment.where(user_id: params[:user_id])
    else
      @comments = Comment.where(artwork_id: params[:artwork_id])
    end
    render json: @comments
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :artwork_id)
  end
end
