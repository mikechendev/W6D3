class UsersController < ApplicationController

    def index
        if params[:username]
            render json: User.search(params[:username])
        else
            @users = User.all
            render json: @users
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_url(@user)
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to users_url(@user)
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def favorite_artworks
        render json: User.find(params[:user_id]).favorite_artworks
    end

    def favorite_shared_artworks
        render json: User.find(params[:user_id]).favorite_shared_artworks
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end