class LikesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @likes = @user.likes
    render json: @likes
  end

  def create
    @user = User.find(params[:user_id])
    @like = @user.likes.new(like_params)

    if @like.save
      redirect_to @like.likeable
    else
      render json: @like.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @like = @user.likes.find(params[:id])
    like = @like.likeable
    @like.destroy
    redirect_to like
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
