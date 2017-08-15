require 'portfolio_manager/rest/request'

module PortfolioManager
  module REST
    ##
    # Utilities used throughout REST Client
    module Utils
      private

      ##
      # @param [String] path
      # @param [Hash] options
      def perform_get_request(path, options = {})
        perform_request(:get, path, options)
      end

      ##
      # @param [String] path
      # @param [Hash] options
      def perform_post_request(path, options = {})
        perform_request(:post, path, options)
      end

      ##
      # @param [Symbol, String] request_method
      # @param [String] path
      # @param [Hash] options
      def perform_request(request_method, path, options = {})
        PortfolioManager::REST::Request.new(
          self,
          request_method,
          path,
          options
        ).perform
      end
    end
  end
end
