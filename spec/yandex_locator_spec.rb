require 'spec_helper'

describe YandexLocator do
  it 'has a version number' do
    expect(YandexLocator::VERSION).not_to be nil
  end

  it 'check default configuration' do
    expect(YandexLocator.configuration.version).to eq "1.0"
  end

end
