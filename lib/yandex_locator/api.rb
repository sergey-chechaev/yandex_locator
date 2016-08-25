require "yandex_locator/configuration"

module YandexLocator
  module API

    class  << self

      def call
        connection(url: YandexLocator.configuration.url_prefix)
      end

      def connection(url: )
        Faraday.new(url) do |builder|
          builder.request  :url_encoded
          builder.response :logger
          builder.adapter  Faraday.default_adapter
        end
      end

    end
  end
end


