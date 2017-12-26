module Mailtime
  class Layout < ActiveRecord::Base

    has_many :templates, :class_name => '::Mailtime::Template'

  end
end
