require 'active_support/configurable'

module Pageboy
  module Config
    include ActiveSupport::Configurable
    config_accessor :per_page
    config_accessor :turners

    def configure
      yield self
    end
  end
end

Pageboy::Config.configure do |config|
  config.per_page = 25
  config.turners = {}
end
