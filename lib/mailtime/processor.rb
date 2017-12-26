module Mailtime
  class Processor

    attr_reader :mail
    def initialize(mail)
      @mail = mail
    end

    def execute
      create_log
      render_body
      self
    end

    private

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