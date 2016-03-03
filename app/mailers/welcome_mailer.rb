class WelcomeMailer < ApplicationMailer
	default from: "welcome@bluegreenchic.com"
	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject:"Welcome #{@user.first_name}!")
	end
end
