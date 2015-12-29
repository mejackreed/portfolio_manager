require 'portfolio_manager/rest/utils'

module PortfolioManager
  module REST
    ##
    # Advanced Settings for Organizations Exchanging Data
    # @see http://portfoliomanager.energystar.gov/webservices/home/api/account
    module DataExchangeSettings
      include PortfolioManager::REST::Utils
      ##
      # This web service retrieves the various settings that describes your data
      # exchange service offerings such as terms and conditions, supported fuel
      # types, etc.
      #
      # @see http://portfoliomanager.energystar.gov/webservices/home/api/account/settings/get
      def data_exchange_settings
        perform_get_request('/dataExchangeSettings')
      end

      ##
      # This web service returns a list of custom fields that are used by your
      # account. These custom fields allow you to gather more data from your
      # customers as they send connection and share requests to you.
      #
      # @see http://portfoliomanager.energystar.gov/webservices/home/api/account/customFieldList/get
      def data_exchange_custom_field_list
        perform_get_request('/dataExchangeSettings/customField/list')
      end
    end
  end
end
