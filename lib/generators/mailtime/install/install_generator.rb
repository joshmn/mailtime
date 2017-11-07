require 'rails/generators/active_record'

module Mailtime
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Installs Mailtime by copying over migrations and an initializer"
      source_root File.expand_path("../templates", __FILE__)

      def copy_initializer
        copy_file 'mailtime.rb', 'config/initializers/mailtime.rb'
      end

      def copy_migrations
        copy_file 'migrations/20171107210800_create_mailtime_logs.rb', 'db/migrate/create_mailtime_logs.rb'
        copy_file 'migrations/20171107210824_create_mailtime_templates.rb', 'db/migrate/create_mailtime_templates.rb'
        copy_file 'migrations/20171107210831_create_mailtime_layouts.rb', 'db/migrate/create_mailtime_layouts.rb'
      end

    end
  end
end