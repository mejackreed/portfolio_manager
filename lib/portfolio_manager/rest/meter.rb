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
      # This web service returns a list of meters that changed since a user specified date. The list of meters returned are account specific.
      # The returned list only shows meters that you have permission to view. Results are returned in increments of 1,000 per set.
      #
      # Dates must be formatted as YYYY-MM-DD
      #
      # @see https://portfoliomanager.energystar.gov/webservices/home/api/meter/getWhatChanged/get
      # pagination template:
      # "/customer/#{customerId}/meter/whatChanged?nextPageKey=#{next_page_key}&date=#{date}"
      def what_changed_meter_list(customer_id, date, next_page_key: nil, previous_page_key: nil)
        query_string = URI.encode_www_form({ date: date, nextPageKey: next_page_key, previousPageKey: previous_page_key }.reject! {|k,v| v.nil?})
        resource_path = "/customer/#{customer_id}/meter/whatChanged"
        link = query_string.empty? ? resource_path : "#{resource_path}?#{query_string}"
        perform_get_request(link)
      end

      ##
      # This web service returns a list of meters within a specified property that changed since a user specified date. The list of meters returned are property specific.
      # The returned list only shows meters that you have permission to view. Results are returned in increments of 1,000 per set.
      #
      # Dates must be formatted as YYYY-MM-DD
      #
      # @see https://portfoliomanager.energystar.gov/webservices/home/api/meter/getWhatChanged/get
      # pagination template:
      # "/property/#{propertyId}/meter/whatChanged?nextPageKey=#{next_page_key}&date=#{date}"
      def what_changed_meter_list_for_property(property_id, date, next_page_key: nil, previous_page_key: nil)
        query_string = URI.encode_www_form({ date: date, nextPageKey: next_page_key, previousPageKey: previous_page_key }.reject! {|k,v| v.nil?})
        resource_path = "/property/#{property_id}/meter/whatChanged"
        link = query_string.empty? ? resource_path : "#{resource_path}?#{query_string}"
        perform_get_request(link)
      end

      ##
      # This web service retrieves a list of consumption data for a specific
      # meter. The meter must already be shared with you.
      #
      # The consumption data is returned in sets of 120. An optional date range can specified to return a certain set of consumption records.
      # Dates must be formatted as YYYY-MM-DD
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

      ##
      # This web service returns a list of meters that have had their consumption data changed since a user specified date. The list of meters returned are account specific.
      # The returned list only shows meters that you have permission to view. Results are returned in increments of 1,000 per set.
      #
      # Dates must be formatted as YYYY-MM-DD
      #
      # @see https://portfoliomanager.energystar.gov/webservices/home/api/meter/consumptionDataGetWhatChanged/get
      # pagination template:
      # "/customer/#{customerId}/meter/consumptionData/whatChanged?nextPageKey=#{next_page_key}&date=#{date}"
      def what_changed_consumption_data_meter_list(customer_id, date, next_page_key: nil, previous_page_key: nil)
        query_string = URI.encode_www_form({ date: date, nextPageKey: next_page_key, previousPageKey: previous_page_key }.reject! {|k,v| v.nil?})
        resource_path = "/customer/#{customer_id}/meter/consumptionData/whatChanged"
        link = query_string.empty? ? resource_path : "#{resource_path}?#{query_string}"
        perform_get_request(link)
      end
    end
  end
end
