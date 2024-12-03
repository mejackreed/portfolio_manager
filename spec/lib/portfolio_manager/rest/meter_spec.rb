# frozen_string_literal: true

require 'spec_helper'

describe PortfolioManager::REST::Meter do
  let(:client) { test_client }
  describe '#meter' do
    let(:id) { 543 }
    before do
      stub_get("/meter/#{id}")
        .to_return(body: fixture('meter.xml'))
    end
    it 'returns a meter' do
      expect(client.meter(id)['meter'])
        .to include 'id', 'type', 'name', 'unitOfMeasure', 'metered', 'firstBillDate'
    end
  end
  describe '#meter_list' do
    let(:id) { 680_01 }
    before do
      stub_get("/property/#{id}/meter/list")
        .to_return(body: fixture('meter_list.xml'))
    end
    it 'returns a list of meters' do
      client.meter_list(id)['response']['links']['link'].each do |link|
        expect(link).to include '@link'
      end
    end
  end
  describe '#consumption_data' do
    let(:id) { 680_01 }
    before do
      stub_get("/meter/#{id}/consumptionData")
        .to_return(body: fixture('meter_consumption_data.xml'))
    end
    it 'returns a meter' do
      expect(client.consumption_data(id)['meterData'].keys)
        .to include 'links', 'meterConsumption'
    end
  end
end
