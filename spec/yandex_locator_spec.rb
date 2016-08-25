require 'spec_helper'

describe YandexLocator do
  it 'has a version number' do
    expect(YandexLocator::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end

  it 'check default configuration' do
    expect(YandexLocator.configuration.user.empty?).to be false
    expect(YandexLocator.configuration.key.empty?).to be false
    expect(YandexLocator.configuration.version).to eq "1.0"
  end

end
