module YandexLocator
  class Client
    def initialize
      @conn = YandexLocator::API.call
    end

    def lookup(ip: nil, mac: nil, cellid: nil, lac: nil, signal_strength: nil)
      result = @conn.post do |req|
        req.url '/geolocation'
        req.headers['Content-Type'] = 'application/json'
        req.params['json'] = insert_data(ip: ip, mac: mac, cellid: cellid, lac: lac, signal_strength: signal_strength).to_json
      end

      JSON.parse(result.body)
    end

    def insert_data(ip: , mac: , cellid: , lac: , signal_strength:)
      {common:
        {version: YandexLocator.configuration.version,
         api_key: YandexLocator.configuration.api_key
        },
        ip: {
          address_v4: ip
        },
        wifi_networks: [
          {
            mac: mac
          },
          gsm_cells: [
            {
              cellid: cellid,
              lac: lac,
              signal_strength: signal_strength,
            }
          ]
        ]
      }
    end
  end
end

