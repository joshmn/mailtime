module Mailtime
  class Log < ActiveRecord::Base

    alias_attribute :mailer_action, :mailer_method

    belongs_to :thing, :polymorphic => true

  end
end
