require 'spec_helper'

describe YandexLocator::Client do
  context "find by ip" do
    it 'response position by ip only' do
      conn = YandexLocator::Client.new
      result = conn.lookup(ip: "109.252.52.39")
      expect(result.position).to be_kind_of Hash
    end
  end
end
