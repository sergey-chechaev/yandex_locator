module YandexLocator
  class Client
    def initialize
      @conn = YandexLocator::API.call
    end

    def lookup(ip: )
      result = @conn.post do |req|
        req.url '/geolocation'
        req.headers['Content-Type'] = 'application/json'
        req.params['json'] = insert_data(ip: ip).to_json
      end

      JSON.parse(result.body)
    end

    def insert_data(ip: )
      {common:
        {version: YandexLocator.configuration.version,
         api_key: YandexLocator.configuration.api_key
        },
        ip: {
          address_v4: ip
        }
      }
    end
  end
end

