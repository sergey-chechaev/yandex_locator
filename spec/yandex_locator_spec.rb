require 'spec_helper'

describe YandexLocator do
  it 'has a version number' do
    expect(YandexLocator::VERSION).not_to be nil
  end

  context 'configiration' do
    it 'check default configuration' do
      expect(YandexLocator.configuration.version).to eq '1.0'
    end

    describe 'class level configuration' do
      it 'api_key' do
        YandexLocator::Client.new(api_key: 'test api key')
        expect(YandexLocator.configuration.api_key).to include('test api key')
      end

      it 'version' do
        YandexLocator::Client.new(version: 'test version')
        expect(YandexLocator.configuration.version).to include('version')
      end
    end
  end
end
