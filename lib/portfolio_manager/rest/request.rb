require 'hurley'
require 'nori'

module PortfolioManager
  module REST
    ##
    # Manage HTTP requests
    class Request
      BASE_URL  = 'https://portfoliomanager.energystar.gov'
      LIVE_PATH = '/ws'
      TEST_PATH = '/wstest'

      attr_reader :client, :path, :request_method, :parser
      ##
      # @param [PortfolioManager::Client] client
      # @param [Symbol, String] request_method
      # @param [String] path
      # @param [Hash] options
      def initialize(client, request_method, path, options)
        @client = client
        @path = path
        @options = options
        @request_method = request_method
        @conn = Hurley::Client.new(BASE_URL)
        @parser = Nori.new
        setup_client
      end

      ##
      # @return [Hash]
      def perform
        parser.parse(response_body)
      end

      private

      ##
      # @return [String]
      def response_body
        @conn.public_send(request_method, api_environment + path).body
      end

      def setup_client
        @conn.header[:user_agent] = 'Ruby PortfolioManager API Client'
        @conn.url.user = client.username
        @conn.url.password = client.password
      end

      def api_environment
        if client.live
          LIVE_PATH
        else
          TEST_PATH
        end
      end
    end
  end
end
