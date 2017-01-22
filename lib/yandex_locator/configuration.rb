module YandexLocator
  class Configuration
    attr_accessor :api_key, :version, :url_prefix

    DEFAULT_CONF = {
      version: '1.0',
      url_prefix: 'http://api.lbs.yandex.net'
    }.freeze

    def initialize
      @key = nil
      @version = DEFAULT_CONF[:version]
      @url_prefix = DEFAULT_CONF[:url_prefix]
    end
  end
end
