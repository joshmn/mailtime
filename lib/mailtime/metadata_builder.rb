#
# Helps build the Mailtime::Log
#
module Mailtime
  class MetadataBuilder

    def self.for(instance)
      new(instance).metadata
    end

    def initialize(instance)
      @instance = instance
    end

    def klass
      @instance.class.to_s
    end

    def action
      @instance.action_name
    end

    def action_variables
      @action_variables ||= @instance.instance_variables.select { |variable| @instance.instance_variable_get(variable).class < ::ActiveRecord::Base }.each_with_object({}) do |v, h|
        h[v.to_s.gsub('@', '')] = @instance.instance_variable_get(v)
      end
    end

    def thing
      @thing ||= begin
        mailtime_enabled_models = action_variables.select { |_, v| v.class.mailtime_enabled? }
        key = mailtime_enabled_models.keys.detect { |k| "#{k.classify}Mailer" == klass || "#{k.classify.to_s.pluralize}Mailer" == klass }
        found = nil
        if key
          found = action_variables[key]
        end
        found
      end
    end

    def context
      action_variables.as_json
    end

    def mailtime_template
      @mailtime_template ||= Mailtime::Template.find_by(:klass => klass, :action => action)
    end

  end
end