module Mailtime
  class Engine < ::Rails::Engine
    isolate_namespace Mailtime

    ActiveSupport.on_load :action_mailer do
      ::ActionMailer::Base.send(:include, Mailtime::ActionMailer::Metadata)
      ::ActionMailer::Base.register_interceptor(::Mailtime::Interceptor)
    end

  end
end
