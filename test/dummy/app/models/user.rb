class User < ActiveRecord::Base

	mailtimer :email

	after_commit :send_mail

	def send_mail
		UserMailer.welcome(self).deliver_now!
	end

end
