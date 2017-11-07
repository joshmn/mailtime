require 'test_helper'

module Mailtime
  class LogTest < ActiveSupport::TestCase
    
    setup do 
    	@user = User.new(:email => "john@mailtime.dev", :name => "John")
    	@user.save!
    	@user.send_mail
    end

    test "user is present" do
    	assert @user.present?
    end

    test "created a mailtime log" do
      assert_equal 1, Mailtime::Log.count
    end

    test "mailtime log has correct user_id" do
      assert_equal Mailtime::Log.last.user_id, @user.id
    end

  end
end
