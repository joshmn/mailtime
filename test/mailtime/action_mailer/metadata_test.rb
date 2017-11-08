require 'test_helper'


module Mailtime
  module ActionMailer
    class MetadataTest < ActiveSupport::TestCase

      setup do
        @user = OpenStruct.new(:email => "hello@mailtime.test", :name => "Test", :id => 1)
        @mailer = UserMailer.welcome(@user)
      end

      test 'mailer responds to mailtime_metadata' do
        assert_equal 'UserMailer', @mailer.mailtime_metadata.mailer_class
        assert_equal 'welcome', @mailer.mailtime_metadata.mailer_action
        assert_equal({'user' => @user}, @mailer.mailtime_metadata.action_variables)
      end

    end
  end
end
