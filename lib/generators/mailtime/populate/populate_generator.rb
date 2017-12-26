require 'rails/generators/active_record'

module Mailtime
  module Generators
    class PopulateGenerator < Rails::Generators::Base

      desc "Does some hocus pocus"

      def create_templates
        Rails.application.eager_load!
        layout = ::Mailtime::Layout.create!(:name => "Default", :content => "<%= yield %>")
        ::ActionMailer::Base.descendants.each do |klass|
          view_paths = klass.view_paths.paths
          klass.instance_methods(false).each do |mthd|
            created = false
            view_paths.each do |view_path|
              break if created
              view_path.instance_variable_get(:@path)
              template = Mailtime::Template.find_or_initialize_by(:action => mthd, :klass => klass)
              if template.new_record?
                template.name = [klass, mthd].join("#")
                template.layout_id = layout.id
                file = File.read("#{view_path}/#{klass.to_s.underscore}/#{mthd}.html.erb") rescue nil
                next if file.nil?
                template.content = file
                created = template.save!
              end
            end
          end

        end
      end

    end
  end
end