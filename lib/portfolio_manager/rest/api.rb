require 'portfolio_manager/rest/account'
require 'portfolio_manager/rest/data_exchange_settings'

module PortfolioManager
  module REST
    ##
    # Web services included from PortfolioManager
    # @see http://portfoliomanager.energystar.gov/webservices/home/api
    module API
      include PortfolioManager::REST::Account
      include PortfolioManager::REST::DataExchangeSettings
    end
  end
end
