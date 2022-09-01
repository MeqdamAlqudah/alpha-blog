class UsersController < ApplicationController
    def index 
        @users = User.all
    end
    
    def new 
        
        @user = User.new
        
    end
    def show 
        @user = User.find(params[:id])
        @articles = Article.where(user_id:params[:id])
    end
    def create 
        @user = User.create(user_params)


        if(@user.save)
            flash[:notice] = "Welcome to alpha blog #{@user.username}, you have signUp  successfully."
            redirect_to articles_path
        else    
            render :new
        end

    end
    def edit 
        @user = User.find(params[:id])
    end
    def update 
        @user = User.find(params[:id])
        if(@user.update(user_params))
            flash[:notice] = "Your account information was successfully updated"
            redirect_to articles_path
        else
            render 'edit'
        end

    end
    def user_params 
        params.require(:user).permit(:username,:email,:password)
    end
    
end
