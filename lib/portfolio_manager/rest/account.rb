require 'portfolio_manager/rest/utils'

module PortfolioManager
  module REST
    ##
    # Basic account
    # @see http://portfoliomanager.energystar.gov/webservices/home/api/account
    module Account
      include PortfolioManager::REST::Utils

      ##
      # This web service retrieves your account information that includes your
      # username, password, contact information, & security questions/answers.
      #
      # @see http://portfoliomanager.energystar.gov/webservices/home/api/account/account/get
      def account
        perform_get_request('/account')
      end

      ##
      # This web service returns a list of properties for a specific customer
      #
      # that are shared with you.
      # @see http://portfoliomanager.energystar.gov/webservices/home/api/property/propertyList/get
      # @param [String, Integer] account_id
      def property_list(account_id)
        perform_get_request("/account/#{account_id}/property/list")
      end
    end
  end
end
