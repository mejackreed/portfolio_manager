module PortfolioManager
  module REST
    ##
    # REST client configuration for PortfolioManager gem.
    class Client
      attr_accessor :username, :password

      def initialize(options = {})
        options.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
        yield self if block_given?
      end
    end
  end
end
