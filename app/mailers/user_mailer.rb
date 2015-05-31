class UserMailer < ApplicationMailer

  	def password_reset(user)
  		@user = user
  		mail :to => user.email, :subject => "Your Password Reset For StayInTouch"
	end
end