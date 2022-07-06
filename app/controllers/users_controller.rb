class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def destroy
    @user.destroy
  end
end
