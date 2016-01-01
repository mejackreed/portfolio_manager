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

### API

API calls implemented from http://portfoliomanager.energystar.gov/webservices/home/api

#### Basic Account Services
http://portfoliomanager.energystar.gov/webservices/home/api/account

HTTP | Path | Method | Description
---- | ---- | ------ | -----------
GET | /account | `account` | Returns general information for your account.
GET | /dataExchangeSettings | `data_exchange_settings` | Returns the settings that define your data exchange service offerings.
GET | /dataExchangeSettings/customField/list | `data_exchange_custom_field_list` | Returns a list of custom fields that you have defined for your account.

#### Property Services
http://portfoliomanager.energystar.gov/webservices/home/api/property

HTTP | Path | Method | Description
---- | ---- | ------ | -----------
GET | /property/(propertyId) | `property(property_id)` | Returns information for a specific property.
GET | /account/(accountId)/property/list | `property_list(account_id)` | Returns a list of properties for a specified user.

#### Building Services
http://portfoliomanager.energystar.gov/webservices/home/api/building

HTTP | Path | Method | Description
---- | ---- | ------ | -----------
GET | /building/(buildingId) | `building` | Returns information for a specific building.
GET | /property/(propertyId)/building/list | `building_list(property_id)` | Returns a list of buildings that belong to a specified property.

#### Meter Services
http://portfoliomanager.energystar.gov/webservices/home/api/meter

HTTP | Path | Method | Description
---- | ---- | ------ | -----------
GET | /meter/(meterId) | `meter(meter_id)` | 	Returns information for a specified meter.
GET | /property/(propertyId)/meter/list	| `meter_list(property_id)` | Returns a list of meters for a specified property.
GET | /meter/(meterId)/consumptionData?page=(page)&startDate=(YYYY-MM-DD)&endDate=(YYYY-MM-DD) | `metrics(property_id, year, month, measurement_system, metric)` | Returns the consumption data for a specified meter in sets of 20.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mejackreed/portfolio_manager.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

