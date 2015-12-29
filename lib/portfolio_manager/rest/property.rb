require 'portfolio_manager/rest/utils'

module PortfolioManager
  module REST
    ##
    # Property services
    # @see http://portfoliomanager.energystar.gov/webservices/home/api/property
    module Property
      include PortfolioManager::REST::Utils

      ##
      # This web service returns a list of properties for a specific customer
      # that are shared with you.
      #
      # @see http://portfoliomanager.energystar.gov/webservices/home/api/property/propertyList/get
      # @param [String, Integer] account_id
      def property_list(account_id)
        perform_get_request("/account/#{account_id}/property/list")
      end

      ##
      # This web service retrieves information for a specific property. The
      # property must already be shared with you. This service can also be used
      # for to retrieve information on a building.
      #
      # @see http://portfoliomanager.energystar.gov/webservices/home/api/property/property/get
      def property(property_id)
        perform_get_request("/property/#{property_id}")
      end
    end
  end
end
