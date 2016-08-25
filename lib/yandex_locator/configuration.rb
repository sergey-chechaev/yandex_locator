module YandexLocator
  class Configuration
    # curl -H "Content-Type: application/json" -X POST -d 'json={"common":{"version":"1.0","api_key":"ABM6WU0BAAAANfFuIQIAV1pUEYIBeogyUNvVbhNaJPWeM-AAAAAAAAAAAACRXgDsaYNpZWpBczn4Lq6QmkwK6g=="},"gsm_cells":[{"countrycode":250,"operatorid":99,"cellid":42332,"lac":36002,"signal_strength":-80,"age":5555}],"wifi_networks":[{"mac":"00-1C-F0-E4-BB-F5","signal_strength":-88,"age":0}],"ip":{"address_v4":"178.247.233.32"}}' http://api.lbs.yandex.net/geolocation
    attr_accessor :api_key, :version, :url_prefix

    def initialize
      @key = nil
      @version = "1.0"
      @url_prefix = "http://api.lbs.yandex.net"
    end

  end
end

