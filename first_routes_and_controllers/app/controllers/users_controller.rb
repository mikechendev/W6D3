class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def new
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    redirect_to users_url(@user)
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:name, :email))
    redirect_to users_url(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end
end
