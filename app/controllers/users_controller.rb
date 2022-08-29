class UsersController < ApplicationController
    def new 

        user = User.create(username:params[:username],email:params[:email],password_digest:params[:password])
        
    end
    def create 
        user = User.create(username:params[:username],email:params[:email],password_digest:params[:password])

        if(user.save)
            flash[:notice] = "User signUp  successfully."
            redirect_to articles_path
        else    
            render json:params 
        end
    end
end
