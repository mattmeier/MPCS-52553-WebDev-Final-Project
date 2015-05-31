class PasswordResetsController < ApplicationController
    
    def show
    end

	#Note: Code is based on the following link: http://railscasts.com/episodes/274-remember-me-reset-password
	def create
		user = User.find_by_email(params[:email])

		user.send_password_reset if user
		redirect_to root_url, :notice => "If inputted email belongs to a registered user, an email has been sent with password reset instructions."

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