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
    end
  end
end
