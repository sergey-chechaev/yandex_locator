[![Gem](https://img.shields.io/gem/v/yandex_locator.svg?style=flat-square)](https://rubygems.org/gems/yandex_locator)
[![Build Status](https://travis-ci.org/sergey-chechaev/yandex_locator.svg?branch=master)](https://travis-ci.org/sergey-chechaev/yandex_locator)
[![Code Climate](https://codeclimate.com/github/sergey-chechaev/yandex_locator.svg)](https://codeclimate.com/github/sergey-chechaev/yandex_locator)
[![Dependency Status](https://www.versioneye.com/user/projects/57bf6ec8968d640033602245/badge.svg?style=flat-square)](https://www.versioneye.com/user/projects/57bf6ec8968d640033602245)
[![Coverage Status](https://coveralls.io/repos/github/sergey-chechaev/yandex_locator/badge.svg)](https://coveralls.io/github/sergey-chechaev/yandex_locator)

# YandexLocator

Ruby gem for Yandex locator (https://tech.yandex.ru/locator/). Yandex locator is a service that finds mobile devices in a region delineated by a circle. The service returns longitude, latitude and precision. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yandex_locator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yandex_locator

## Usage

Configure gem credentials 

```ruby
 YandexLocator.configure do |config|
   config.api_key = 'api key'
   config.version = '1.0'
 end
```
or

```ruby
  client = YandexLocator::Client.new(api_key: 'api key', version: '1.0')
  client.lookup(ip: { address_v4: '178.247.233.3' })
```
Make request

```ruby
  client = YandexLocator::Client.new(api_key: 'api key', version: '1.0')
  result = client.lookup(ip: { address_v4: '178.247.233.3' })
  result.position
  # => {"altitude"=>0.0, "altitude_precision"=>30.0, "latitude"=>41.00892639160156, "longitude"=>28.96711158752441, "precision"=>100000.0, "type"=>"ip"}
  result = client.lookup(
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
  result.position
  # => {"altitude"=>0.0, "altitude_precision"=>30.0, "latitude"=>56.87141036987305, "longitude"=>60.61107635498047, "precision"=>1066.041137695312, "type"=>"gsm"}
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org/gems/yandex_locator).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sergey-chechaev/yandex_locator.

