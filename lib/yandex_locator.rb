require 'faraday'
require 'json'

require "yandex_locator/version"
require "yandex_locator/configuration"
require "yandex_locator/client"
require "yandex_locator/api"

module YandexLocator
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

end
