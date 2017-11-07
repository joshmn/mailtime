module Mailtime
  class Log < ActiveRecord::Base

    alias_attribute :mailer_action, :mailer_method

  end
end
