# frozen_string_literal: true

require 'spec_helper'

describe PortfolioManager::REST::DataExchangeSettings do
  let(:client) { test_client }
  describe '#data_exchange_settings' do
    before do
      stub_get('/dataExchangeSettings')
        .to_return(body: fixture('data_exchange_settings.xml'))
    end
    it 'returns an dataExchangeSettings element' do
      expect(client.data_exchange_settings['dataExchangeSettings'])
        .to include 'termsOfUse', 'supportedMeterTypes'
    end
  end
  describe '#data_exchange_custom_field_list' do
    before do
      stub_get('/dataExchangeSettings/customField/list')
        .to_return(body: fixture('data_exchange_custom_field_list.xml'))
    end
    it 'returns a response element and links' do
      client
        .data_exchange_custom_field_list['response']['links']['link']
        .each do |link|
          expect(link).to include '@link'
        end
    end
  end
end
