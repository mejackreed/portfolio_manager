# frozen_string_literal: true

require 'portfolio_manager/rest/utils'

module PortfolioManager
  module REST
    module Reporting
      include PortfolioManager::REST::Utils

      def property_metrics(property_id, year, month, measurement_system, metric)
        perform_get_request(
          "/property/#{property_id}/metrics",
          query: {
            year: year, month: month, measurementSystem: measurement_system
          },
          header: {
            'PM-Metrics' => metric
          }
        )
      end
    end
  end
end
