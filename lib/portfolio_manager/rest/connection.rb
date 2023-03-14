# frozen_string_literal: true

require 'portfolio_manager/rest/utils'

module PortfolioManager
  module REST
    ##
    # Connection services
    # @see https://portfoliomanager.energystar.gov/webservices/home/api/connection
    module Connection
      include PortfolioManager::REST::Utils
      REJECT_NOTE = 'Unfortunately we cannot provide services for you at this time.'
      ACCEPT_NOTE = 'Your connection request has been verified and accepted.'

      ##
      # This web service returns a list of pending customer connection requests.
      # A connection to the customer must be established first before any properties and meters can be shared with you.
      # The list of pending customer connection requests is returned in sets of 20.
      #
      # @see https://portfoliomanager.energystar.gov/webservices/home/api/connection/pendingAccountList/get
      def pending_connections(link = nil)
        link ||= '/connect/account/pending/list'
        perform_get_request(link)
      end

      ##
      # Accepts/rejects a pending connection request from a specific customer.
      #
      # @see https://portfoliomanager.energystar.gov/webservices/home/api/connection/connect/post
      def connection_request(customer_id, accept = true)
        perform_post_request(
          "/connect/account/#{customer_id}",
          body: connection_response_body(accept)
        )
      end

      private

      def connection_response_body(accept)
        action = accept ? 'Accept' : 'Reject'
        note = accept ? ACCEPT_NOTE : REJECT_NOTE
        request_response_xml(action, note)
      end
    end
  end
end
