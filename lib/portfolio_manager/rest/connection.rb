require 'portfolio_manager/rest/utils'

module PortfolioManager
  module REST
    ##
    # Customer services
    # @see https://portfoliomanager.energystar.gov/webservices/home/api/account
    module Connection
      include PortfolioManager::REST::Utils

      ##
      # Returns a list of customer connection requests that are pending.
      #
      # @see https://portfoliomanager.energystar.gov/webservices/home/api/connection/pendingAccountList/get
      def pending_list
        perform_get_request("/connect/account/pending/list")
      end

      ##
      # Accepts/rejects a pending connection request from a specific customer.
      #
      # https://portfoliomanager.energystar.gov/webservices/home/api/connection/connect/post
      def connection(customer_id, accept = true)
        perform_post_request(
            "/connect/account/#{customer_id}",
            body: request_body(accept)
          )
      end

      private

      def request_body(accept)
        reject_note = 'Unfortunately we cannot provide services for you at this time.'
        accept_note = 'Your connection request has been verified and accepted.'
        action = accept ? 'Accept' : 'Reject'
        note = accept ? accept_note : reject_note
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.sharingResponse {
            xml.action action
            xml.note note
          }
        end
        builder.doc.root.to_s
      end
    end
  end
end
