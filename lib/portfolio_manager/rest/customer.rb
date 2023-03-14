# frozen_string_literal: true

require 'portfolio_manager/rest/utils'

module PortfolioManager
  module REST
    ##
    # Customer services
    # @see https://portfoliomanager.energystar.gov/webservices/home/api/account
    module Customer
      include PortfolioManager::REST::Utils

      ##
      # Returns a list of customers that you are connected to.
      #
      # @see https://portfoliomanager.energystar.gov/webservices/home/api/account/customerList/get
      def customer_list
        perform_get_request('/customer/list')
      end

      ##
      # Returns general account information for a specific customer that you are connected to.
      #
      # https://portfoliomanager.energystar.gov/webservices/home/api/account/customer/get
      def customer(customer_id)
        perform_get_request("/customer/#{customer_id}")
      end
    end
  end
end
