# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show eidt update destroy]
  before_action :require_same_user, only: %i[edit update destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @articles = Article.where(user_id: params[:id])
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to alpha blog #{@user.username}, you have signUp  successfully."
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Your account information was successfully updated'
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    session[:user_id] = nil unless current_user.admin?
    @user.destroy
    flash[:notice] = 'Account and all associated articles  successfully deleted!!'
    redirect_to articles_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = 'You can only edit or delete your own account!!'
      redirect_to @user
    end
  end
end
