require 'rails'

require 'mailtime'

module Mailtime
  class Engine < ::Rails::Engine

    isolate_namespace Mailtime

    ActiveSupport.on_load :action_mailer do
      ::ActionMailer::Base.send(:include, Mailtime::ActionMailer::Metadata)
      ::ActionMailer::Base.send(:extend, Mailtime::ActionMailer::SkipMailtimeFor)
      ::ActionMailer::Base.register_interceptor(::Mailtime::Interceptor)

      class ::ActionMailer::Base
        def self.skip_mailtime_for(*method_names)
          self.skip_mailtime_for_methods = method_names
        end
      end
    end

    ActiveSupport.on_load :active_record do
      ::ActiveRecord::Base.send(:include, Mailtime::Mailtimer)
    end

  end
end
