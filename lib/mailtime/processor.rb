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
      Mailtime::Log.create(:thing_id => mail.mailtime_metadata.thing.id,
                           :thing_type => mail.mailtime_metadata.thing.class.to_s,
                           :mailer_class => mail.mailtime_metadata.klass,
                           :mailer_action => mail.mailtime_metadata.action)
    end

    def thing
      mail.mailtime_metadata.thing
    end

  end
end