# frozen_string_literal: true

require 'portfolio_manager/rest/utils'

module PortfolioManager
  module REST
    ##
    # Share services
    # @see https://portfoliomanager.energystar.gov/webservices/home/api/connection
    module Share
      include PortfolioManager::REST::Utils

      ##
      # Returns a list of property or meter share requests that are pending.
      # These property share requests belong to customers that you are already connected to.
      # The list of pending property share requests is returned in sets of 20.
      #
      # @see https://portfoliomanager.energystar.gov/webservices/home/api/connection/pendingPropertyList/get
      # @see https://portfoliomanager.energystar.gov/webservices/home/api/connection/pendingMeterList/get
      def pending_meter_shares(link = nil)
        pending_shares(:meter, link)
      end

      def pending_property_shares(link = nil)
        pending_shares(:property, link)
      end

      ##
      # Accepts/rejects a pending share request for a specific property or meter.
      #
      # @see https://portfoliomanager.energystar.gov/webservices/home/api/connection/shareProperty/post
      # @see https://portfoliomanager.energystar.gov/webservices/home/api/connection/shareMeter/post
      def meter_share_request(meter_id, accept = true)
        share_request(meter_id, :meter, accept)
      end

      def property_share_request(property_id, accept = true)
        share_request(property_id, :property, accept)
      end

      private

      def pending_shares(resource_name, link)
        link ||= "/share/#{resource_name}/pending/list"
        perform_get_request(link)
      end

      def share_request(resource_id, resource_name, accept = true)
        perform_post_request(
          "/share/#{resource_name}/#{resource_id}",
          body: share_response_body(accept, resource_name)
        )
      end

      def share_response_body(accept, resource_name)
        accept_note = "Your #{resource_name} sharing request has been verified and accepted."
        reject_note = "Your #{resource_name} sharing request has been rejected."
        action = accept ? 'Accept' : 'Reject'
        note = accept ? accept_note : reject_note
        request_response_xml(action, note)
      end
    end
  end
end
