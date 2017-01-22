require 'yandex_locator/api'

module YandexLocator
  class Client
    include YandexLocator::API

    def initialize(api_key: nil, version: nil)
      YandexLocator.configuration.api_key = api_key if api_key
      YandexLocator.configuration.version = version if version
    end

    def lookup(options = {})
      post 'geolocation', options
    end
  end
end
