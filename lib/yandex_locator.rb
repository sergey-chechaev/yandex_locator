require 'faraday'
require 'json'
require 'yandex_locator/version'
require 'yandex_locator/configuration'
require 'yandex_locator/client'
require 'yandex_locator/api'

module YandexLocator
  class << self
    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def reset
      @configuration = Configuration.new
    end

    def configure
      yield(configuration)
    end
  end

end
