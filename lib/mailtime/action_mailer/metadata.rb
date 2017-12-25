module Mailtime
  module ActionMailer
    module Metadata

      def self.included(base)
        base.include AbstractController::Callbacks
        base.after_action :inject_mailtime_metadata
      end

      private

      def mailtime_metadata
      	@mailtime_metadata ||= Mailtime::MetadataBuilder.new(self)
      end

      def inject_mailtime_metadata
        self.message.instance_variable_set(:@mailtime_metadata, mailtime_metadata)
        self.message.class.send(:attr_reader, :mailtime_metadata)
      end

    end
  end
end