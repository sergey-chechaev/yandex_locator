$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'yandex_locator'

RSpec.configure do |config|
  config.before(:all) do
    YandexLocator.configure do |config|
      config.api_key = ENV['YANDEX_API_KEY']
      config.version = "0.1"
    end
  end
end

