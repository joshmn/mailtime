class User < ActiveRecord::Base

	after_commit :send_mail

	def send_mail
		UserMailer.welcome(self).deliver!
	end
	

end
