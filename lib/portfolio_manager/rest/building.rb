# frozen_string_literal: true

require 'portfolio_manager/rest/utils'

module PortfolioManager
  module REST
    ##
    # Building services
    # @see http://portfoliomanager.energystar.gov/webservices/home/api/building
    module Building
      include PortfolioManager::REST::Utils

      ##
      # This web service retrieves information for a specific building. The
      # building must already be shared with you.
      #
      # @see http://portfoliomanager.energystar.gov/webservices/home/api/building/building/get
      # @param [String, Integer] building_id
      def building(building_id)
        perform_get_request("/building/#{building_id}")
      end

      ##
      # This web service returns a list of buildings for a specific property
      # that is shared with you.
      #
      # @see http://portfoliomanager.energystar.gov/webservices/home/api/building/buildingList/get
      def building_list(property_id)
        perform_get_request("/property/#{property_id}/building/list")
      end
    end
  end
end
