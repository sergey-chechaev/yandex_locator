$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'yandex_locator'
require 'vcr'
require 'coveralls'
require 'dotenv/load'

Coveralls.wear!

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.before(:all) do
    YandexLocator.configure do |c|
      c.api_key = ENV['YANDEX_TEST_API_KEY']
      c.version = '1.0'
    end
  end
end
