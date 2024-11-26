# frozen_string_literal: true

require 'spec_helper'

describe PortfolioManager::REST::Reporting do
  let(:client) { test_client }
  describe '#property_metrics' do
    let(:id) { 712 }
    let(:year) { 2000 }
    let(:month) { 12 }
    let(:measurement_system) { 'EPA' }
    let(:metric) { 'score' }
    before do
      stub_request(:get, "https://portfoliomanager.energystar.gov/wstest/property/#{id}/metrics?measurementSystem=#{measurement_system}&month=#{month}&year=#{year}")
        .with(headers: {
                'Accept' => 'application/xml',
                'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                'Authorization' => 'Basic dXNlcjpwYXNz',
                'Content-Type' => 'application/xml;charset=UTF-8',
                'Pm-Metrics' => 'score',
                'User-Agent' => 'Ruby PortfolioManager API Client'
              })
        .to_return(body: fixture('property_metrics.xml'))
    end
    it 'returns requested property metric' do
      expect(client.property_metrics(id, year, month, measurement_system, metric)['propertyMetrics']['metric']['value'])
        .to eq('75')
    end
  end
end
