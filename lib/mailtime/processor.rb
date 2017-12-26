module Mailtime
  class Processor

    attr_reader :mail
    def initialize(mail)
      @mail = mail
    end

    def execute
      if should_be_processed?
        create_log
        render_body
      end
      self
    end

    private

    def should_not_be_processed?
      mail.mailtime_metadata.klass.constantize.skip_mailtime_for_methods.map(&:to_sym).include?(mail.mailtime_metadata.action.to_sym)
    end

    def should_be_processed?
      !should_not_be_processed?
    end

    def create_log
      Mailtime::Log.create(:thing_id => mail.mailtime_metadata.thing.id,
                           :thing_type => mail.mailtime_metadata.thing.class.to_s,
                           :mailer_class => mail.mailtime_metadata.klass,
                           :mailer_action => mail.mailtime_metadata.action)
    end

    def render_body
      renderer = render_klass.new(mail)
      @mail.body = renderer.render
    end

    def render_klass
      Mailtime.configuration.renderer.to_s.safe_constantize || ::Mailtime::Renderer
    end
  end
end