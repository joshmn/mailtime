require 'test_helper'

module Mailtime
  class MailtimerTest < ActiveSupport::TestCase

    setup do
      @mailtimer_klass = User
      @not_mailtimer_klass = Account
    end

    test "responds to mailtimer" do
      assert @mailtimer_klass.mailtimer?
      assert !@not_mailtimer_klass.mailtimer?
    end

  end
end
