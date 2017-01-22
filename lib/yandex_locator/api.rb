require "yandex_locator/configuration"

module YandexLocator
  module API
    def post(url, options = {})
      request :post, url, options
    end

    def call
      connection(url: YandexLocator.configuration.url_prefix)
    end

    def connection(url:)
      Faraday.new(url) do |builder|
        builder.request  :url_encoded
        builder.response :logger
        builder.adapter  Faraday.default_adapter
      end
    end

    private

    def request(method, path, data)
      response = call.send(method) do |req|
        req.url path
        req.headers['Content-Type'] = 'application/json'
        req.params['json'] = request_data(data).to_json
      end

      pars_response(response.body)
    end

    def request_data(data)
      {
        common:
        {
          version: YandexLocator.configuration.version,
          api_key: YandexLocator.configuration.api_key
        }
      }.merge(data)
    end

    def pars_response(body)
      data = JSON.parse(body)
      OpenStruct.new(data)
    end
  end
end
