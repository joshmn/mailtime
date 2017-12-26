require 'mailtime/mailtimer'
require 'mailtime/engine'

require 'mailtime/renderer'
require 'mailtime/processor'
require 'mailtime/interceptor'
require 'mailtime/metadata_builder'
require 'mailtime/action_mailer/metadata'

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
