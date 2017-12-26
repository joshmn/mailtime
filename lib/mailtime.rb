require 'mailtime/mailtimer'
require 'mailtime/action_mailer/skip_mailtime_for'
require 'mailtime/action_mailer/metadata'
require 'mailtime/engine'

require 'mailtime/renderer'
require 'mailtime/processor'
require 'mailtime/interceptor'
require 'mailtime/metadata_builder'

module Mailtime
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :renderer

    def initialize
      @renderer = ::Mailtime::Renderer
    end
  end
end
