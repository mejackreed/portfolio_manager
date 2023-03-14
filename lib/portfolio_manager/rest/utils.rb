# frozen_string_literal: true

require 'portfolio_manager/rest/request'
require 'nokogiri'

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

      def request_response_xml(action, note)
        Nokogiri::XML::Builder.new do |xml|
          xml.sharingResponse do
            xml.action action
            xml.note note
          end
        end.to_xml
      end
    end
  end
end
