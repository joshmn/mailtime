module Mailtime
  class Renderer

    def initialize(mail)
      @mail = mail
    end

    # todo: clean
    def render
      if template
        @mail.mailtime_metadata.action_variables.each do |k,v|
          instance_variable_set("@#{k}", v)
        end
        layout = ERB.new(Mailtime::Layout.find(template.layout_id).content)
        inner = ERB.new(template.content)

        result = layout.result(get_binding {
          inner.result(binding)
        })
        return result
      end
      @mail.body
    end

    private

    def get_binding
      binding
    end

    def template
      @template ||= ::Mailtime::Template.find_by(:klass => @mail.mailtime_metadata.klass, :action => @mail.mailtime_metadata.action)
    end

  end
end