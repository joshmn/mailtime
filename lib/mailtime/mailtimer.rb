#
# Allows
#
module Mailtime
  module Mailtimer
    extend ActiveSupport::Concern

    module ClassMethods

      def mailtimer(email_attribute = :email, options = {})
        cattr_accessor :mailtimer_email_attribute
        cattr_accessor :mailtimer_options
        self.mailtimer_email_attribute = email_attribute.to_sym
        self.mailtimer_options = options.symbolize_keys
      end

      def find_for_mailtimer(email)
        self.find_by(mailtimer_email_attribute => email)
      end

      def mailtimer?
        respond_to?(:mailtimer_email_attribute)
      end

      alias_method :mailtime_enabled?, :mailtimer?

    end
  end
end