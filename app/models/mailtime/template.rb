module Mailtime
  class Template < ActiveRecord::Base

    belongs_to :layout, :class_name => '::Mailtime::Layout'

  end
end
