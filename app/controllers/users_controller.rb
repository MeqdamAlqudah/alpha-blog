class UsersController < ApplicationController
  before_action :set_user, only: %i[show eidt update]
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

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
