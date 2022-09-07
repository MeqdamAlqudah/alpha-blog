class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.where(email: params[:email])[0]
    if @user.authenticate(params[:password])
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def destroy; end
end
