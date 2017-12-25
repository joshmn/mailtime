require 'rails/generators/active_record'

module Mailtime
  module Generators
    class InstallGenerator < Rails::Generators::Base

      desc "Installs Mailtime by copying over migrations and an initializer"
      source_root File.expand_path("../templates", __FILE__)

      def copy_initializer
        copy_file 'mailtime.rb', 'config/initializers/mailtime.rb'
      end

    end
  end
end