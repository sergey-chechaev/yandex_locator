require 'spec_helper'

describe YandexLocator::Client do

  before do
    @client = YandexLocator::Client.new(api_key: ENV['YANDEX_API_KEY'])
  end

  describe 'find by ip', :vcr do
    it 'return position' do
      result = @client.lookup(ip: { address_v4: '178.247.233.3' })
      expect(result.position).to be_kind_of Hash
      expect(result.position['type']).to eq('ip')
    end
  end

  describe 'invalid api_key', :vcr do
    it 'return error' do
      conn = YandexLocator::Client.new(api_key: 'invalid api key')
      result = conn.lookup(ip: '178.247.233.32')

      expect(result.error['text']).to eq('invalid api_key')
    end
  end

  describe 'location not found', :vcr do
    it 'return error' do
      result = @client.lookup(ip: '176.69.53.253')

      expect(result.error['text']).to eq('Location not found')
    end
  end

  describe 'find by wifi_networks', :vcr do
    it 'return wifi position' do
      result = @client.lookup(
        wifi_networks: [{
          mac: 'ec:43:f6:d1:a2:1e'
        }]
      )

      expect(result.position['type']).to eq('wifi')
    end
  end

  describe 'find by gsm_cells', :vcr do
    it 'return gsm position' do
      result = @client.lookup(
        gsm_cells: [{
          countrycode: 250,
          operatorid: 99,
          cellid: 12_082,
          lac: 25_254
        }]
      )

      expect(result.position['type']).to eq('gsm')
    end
  end

  describe 'find by all', :vcr do
    it 'return position' do
      result = @client.lookup(
        wifi_networks: [{
          mac: 'ec:43:f6:d1:a2:1e'
        }],
        gsm_cells: [{
          countrycode: 250,
          operatorid: 99,
          cellid: 12_082,
          lac: 25_254
        }],
        ip: {
          address_v4: '178.247.233.3'
        }
      )

      expect(result.position['type']).to eq('gsm')
    end
  end
end
