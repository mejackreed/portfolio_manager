# frozen_string_literal: true

require 'portfolio_manager/rest/utils'

module PortfolioManager
  module REST
    ##
    # Meter services
    # @see http://portfoliomanager.energystar.gov/webservices/home/api/meter
    module Meter
      include PortfolioManager::REST::Utils

      ##
      # This web service retrieves information for a specific meter. The meter
      # must already be shared with you.
      #
      # @see http://portfoliomanager.energystar.gov/webservices/home/api/meter/meter/get
      # @param [String, Integer] meter_id
      def meter(meter_id)
        perform_get_request("/meter/#{meter_id}")
      end

      ##
      # This web service retrieves a list of all the meters for a specific
      # property. The property must already be shared with you.
      #
      # @see http://portfoliomanager.energystar.gov/webservices/home/api/meter/meterList/get
      def meter_list(property_id)
        perform_get_request("/property/#{property_id}/meter/list")
      end

      ##
      # This web service retrieves a list of consumption data for a specific
      # meter. The meter must already be shared with you.
      #
      # @see https://portfoliomanager.energystar.gov/webservices/home/api/meter/consumptionData/get
      # page_link template:
      # "/meter/#{meter_id}/consumptionData/?page=#{page}&startDate=#{start_date}&endDate=#{end_date}"
      def consumption_data(meter_id, page: nil, start_date: nil, end_date: nil)
        query_string = URI.encode_www_form({ page: page, startDate: start_date, endDate: end_date }.reject! {|k,v| v.nil?})
        resource_path = "/meter/#{meter_id}/consumptionData"
        link = query_string.empty? ? resource_path : "#{resource_path}?#{query_string}"
        perform_get_request(link)
      end
    end
  end
end
