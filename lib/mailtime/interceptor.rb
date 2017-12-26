#
# Intercepts from ActionMailer::Base upon delivery
#

module Mailtime
  class Interceptor
    def self.delivering_email(mail)
      processor = Mailtime::Processor.new(mail)
      processor.execute
      processor.mail
    end
  end
end

