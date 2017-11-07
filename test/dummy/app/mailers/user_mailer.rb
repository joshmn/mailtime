class UserMailer < ActionMailer::Base

	def welcome(user)
		@user = user 
    mail(:to => @user.email, :subject => "Welcome", :from => "hello@mailtime.test")
	end

end

