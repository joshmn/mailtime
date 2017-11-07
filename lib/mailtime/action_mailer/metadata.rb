module Mailtime
  module ActionMailer
    module Metadata

      def self.included(base)
        base.include AbstractController::Callbacks
        base.after_action :inject_mailtime_metadata
      end

      protected

      def instance_variables_map
        @instance_variables_map ||= self.instance_variables.select { |variable| !variable.to_s.start_with?("@_") }.each_with_object({}) do |v, h|
          h[v.to_s.gsub('@', '')] = instance_variable_get(v)
        end
      end

      private

      def mailtime_metadata
      	OpenStruct.new(
      		:mailer_class => self.class.to_s, 
      		:mailer_action => self.action_name,
      		:action_variables => instance_variables_map
        )
      end

      def inject_mailtime_metadata
        self.message.instance_variable_set(:@mailtime_metadata, mailtime_metadata)
        self.message.class.send(:attr_reader, :mailtime_metadata)
      end

    end
  end
end