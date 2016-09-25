$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'yandex_locator'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

RSpec.configure do |config|
  config.before(:all) do
    YandexLocator.configure do |config|
      config.api_key = ENV['YANDEX_API_KEY']
      config.version = "1.0"
    end
  end
end

