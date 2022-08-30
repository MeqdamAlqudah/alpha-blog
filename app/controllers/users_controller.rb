class UsersController < ApplicationController
    def new 
        
        @user = User.create(username:params[:username],email:params[:email],password_digest:params[:password])
        
    end
    def create 
        @user = User.create(username:params[:user]["username"],email:params[:user]["email"],password_digest:params[:user]["password"])


        if(@user.save)
            flash[:notice] = "User signUp  successfully."
            redirect_to articles_path
        else    
            render :new
        end
    end
end
