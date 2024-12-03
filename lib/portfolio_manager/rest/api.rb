# frozen_string_literal: true

require 'portfolio_manager/rest/account'
require 'portfolio_manager/rest/building'
require 'portfolio_manager/rest/data_exchange_settings'
require 'portfolio_manager/rest/meter'
require 'portfolio_manager/rest/property'
require 'portfolio_manager/rest/reporting'
require 'portfolio_manager/rest/customer'
require 'portfolio_manager/rest/connection'
require 'portfolio_manager/rest/share'

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
      include PortfolioManager::REST::Reporting
      include PortfolioManager::REST::Customer
      include PortfolioManager::REST::Connection
      include PortfolioManager::REST::Share
    end
  end
end
