class PasswordResetsController < ApplicationController
    
    def show
    end
    
    #Note that the code is very much based on this link: http://railscasts.com/episodes/274-remember-me-reset-password
    def create
        user = User.find_by_email(params[:email])
        
        user.send_password_reset if user
        redirect_to root_url, :notice => "An email has been sent with password reset instructions."
        
    end
    
    def edit
        @user = User.find_by_password_reset_token!(params[:id])
    end
    
    def update
        
        @user = User.find_by(:password_reset_token => params[:id])
        
        if params[:password] == params[:password_confirmation]
            
            puts(@user.name);
            @user.password = params[:password]
            
            if @user.password_reset_sent_at < 1.hours.ago
                redirect_to root_url, :notice => "Your password reset request has expired."
                elsif @user.save
                redirect_to root_url, :notice => "Password has successfully been reset!"
                else
                render :edit
            end
            
            else
            flash[:notice] = "Error: confirmation and password do not match."
            render :edit
        end
    end
end