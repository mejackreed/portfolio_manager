require 'portfolio_manager/rest/api'
require 'portfolio_manager/rest/utils'

module PortfolioManager
  module REST
    ##
    # REST client configuration for PortfolioManager gem.
    class Client
      include PortfolioManager::REST::API
      attr_accessor :username, :password, :live

      def initialize(options = {})
        @live = false
        options.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
        yield self if block_given?
      end
    end
  end
end
