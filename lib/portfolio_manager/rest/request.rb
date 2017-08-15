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
      CONTENT_TYPE = 'application/xml'

      attr_reader :client, :path, :request_method, :parser, :request_body, :full_path
      attr_accessor :options
      ##
      # @param [PortfolioManager::Client] client
      # @param [Symbol, String] request_method
      # @param [String] path
      # @param [Hash] options used for creating query params and headers
      def initialize(client, request_method, path, options)
        @client = client
        @path = api_environment + path
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
        case request_method
        when :get
          @conn.get(path).body
        when :post
          @conn.post(path, options[:body], CONTENT_TYPE).body
        else
          raise ArgumentError, '#{request_method} is not yet implemented'
        end
      end

      def setup_client
        set_header
        set_query
        set_basic_authentication
      end

      def set_header
        @conn.header[:user_agent] = 'Ruby PortfolioManager API Client'
        options[:header].each do |key, value|
          @conn.header[key] = value
        end unless options[:header].nil?
      end

      def set_query
        options[:query].each do |key, value|
          @conn.query[key] = value
        end unless options[:query].nil?
      end

      def set_body
        @request_body = options[:body]
      end

      def set_basic_authentication
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
