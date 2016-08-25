# YandexLocator

Ruby gem for Yandex locator (https://tech.yandex.ru/locator/). Yandex locator service that find mobile devices in a region delineated by a circle. Service return longitude, latitude and precision. 

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
    config.api_key = ENV['YANDEX_API_KEY']
    config.version = "1.0"
 end
```

Make request

```ruby
  conn = YandexLocator::Client.new
  result = conn.lookup(ip: "109.252.52.39")
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/yandex_locator.

