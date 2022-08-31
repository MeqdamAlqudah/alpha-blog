class UsersController < ApplicationController
    def new 
        
        @user = User.new
        
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
    def user_params 
        params.require(:user).permit(:username,:email,:password)
    end
end
