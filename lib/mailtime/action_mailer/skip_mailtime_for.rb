module Mailtime
  module ActionMailer
    module SkipMailtimeFor
      cattr_accessor(:skip_mailtime_for_methods) { [] }
    end
  end
end