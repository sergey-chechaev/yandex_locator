require 'yandex_locator/api'

module YandexLocator
  class Client
    include YandexLocator::API

    def lookup(options = {})
      post 'geolocation', options
    end

  end
end

