class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:username)
  end

  def create
      @user = User.new(user_params)
      if @user.save
          redirect_to users_url(@user)
      else
          user.errors.full_messages
      end
  end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_url
  end

  def index
      @users = User.all
      render json: @users
  end

  def show
      @user = User.find(params[:id])
      redirect_to users_url(@user)
  end

  def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to users_url(@user)
  end
end
