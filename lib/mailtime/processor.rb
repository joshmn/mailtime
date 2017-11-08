module Mailtime
  class Processor

    attr_reader :mail
    def initialize(mail)
      @mail = mail
    end

    def execute
      create_log
      self
    end

    private

    def create_log
      Mailtime::Log.create(:user_id => user_id,
                           :mailer_class => mail.mailtime_metadata.mailer_class,
                           :mailer_action => mail.mailtime_metadata.mailer_action)
    end

    def user_id
      User.find_for_mailtimer(mail.to).try(:id) || mail.mailtime_metadata.action_variables.stringify_keys['user'].try(:id)
    end

  end
end