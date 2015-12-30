require 'portfolio_manager/rest/account'
require 'portfolio_manager/rest/building'
require 'portfolio_manager/rest/data_exchange_settings'
require 'portfolio_manager/rest/meter'
require 'portfolio_manager/rest/property'

module PortfolioManager
  module REST
    ##
    # Web services included from PortfolioManager
    # @see http://portfoliomanager.energystar.gov/webservices/home/api
    module API
      include PortfolioManager::REST::Account
      include PortfolioManager::REST::Building
      include PortfolioManager::REST::DataExchangeSettings
      include PortfolioManager::REST::Meter
      include PortfolioManager::REST::Property
    end
  end
end
