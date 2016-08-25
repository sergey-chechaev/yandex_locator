require 'spec_helper'

describe YandexLocator do
  it 'has a version number' do
    expect(YandexLocator::VERSION).not_to be nil
  end

  context "configiration" do

    it 'check default configuration' do
      expect(YandexLocator.configuration.version).to eq "1.0"
    end

    it 'check set new configuration value' do
      YandexLocator.configure do |config|
        config.api_key = "test_api_key"
        config.version = "2.0"
      end

      expect(YandexLocator.configuration.api_key).to eq("test_api_key")
      expect(YandexLocator.configuration.version).to eq("2.0")
    end
  end

end
