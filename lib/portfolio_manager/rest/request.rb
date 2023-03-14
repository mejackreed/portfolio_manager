# frozen_string_literal: true

require 'faraday'
require 'faraday/xml'
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

      attr_reader :client, :path, :request_method, :parser
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
        @conn = Faraday.new(url: BASE_URL) do |conn|
          conn.request :authorization, :basic, client.username, client.password
          conn.request :xml
        end
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
          @conn.post(path, options[:body]).body
        else
          raise ArgumentError, "#{request_method} is not yet implemented"
        end
      end

      def setup_client
        set_header
        set_query
      end

      def set_header
        headers = {
          'User-Agent' => 'Ruby PortfolioManager API Client',
          'Accept' => 'application/xml',
          'Content-Type' => 'application/xml;charset=UTF-8'
        }

        options[:header]&.each do |key, value|
          headers[key] = value
        end

        @conn.headers = headers
      end

      def set_query
        params = {}
        options[:query]&.each do |key, value|
          params[key] = value
        end

        @conn.params = params
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
