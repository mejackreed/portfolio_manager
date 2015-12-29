# PortfolioManager
[![Build Status](https://travis-ci.org/mejackreed/portfolio_manager.svg?branch=master)](https://travis-ci.org/mejackreed/portfolio_manager) | [![Coverage Status](https://coveralls.io/repos/mejackreed/portfolio_manager/badge.svg?branch=master&service=github)](https://coveralls.io/github/mejackreed/portfolio_manager?branch=master)

A Ruby client for the [EnergyStar Portfolio Manager web services](http://portfoliomanager.energystar.gov/webservices/home). Inspired by the [Twitter Ruby Gem](https://github.com/sferik/twitter).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'portfolio_manager'
```

And then execute:

    $ bundle

## Usage

### Configuration

```ruby
client = PortfolioManager::REST::Client.new do |config|
  config.username = 'user'
  config.password = 'secret password'
  # Use the "live" site
  config.live     = true #defaults to false
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mejackreed/portfolio_manager.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

