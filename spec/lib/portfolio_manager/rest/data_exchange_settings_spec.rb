require 'spec_helper'

describe PortfolioManager::REST::DataExchangeSettings do
  let(:client) { test_client }
  describe '#data_exchange_settings' do
    before do
      stub_get('/dataExchangeSettings')
        .to_return(body: fixture('data_exchange_settings.xml'))
    end
    it 'returns an dataExchangeSettings element' do
      expect(client.data_exchange_settings)
        .to have_xpath('/dataExchangeSettings')
    end
  end
  describe '#data_exchange_custom_field_list' do
    before do
      stub_get('/dataExchangeSettings/customField/list')
        .to_return(body: fixture('data_exchange_custom_field_list.xml'))
    end
    it 'returns a response element and links' do
      expect(client.data_exchange_custom_field_list)
        .to have_xpath('/response')
      expect(client.data_exchange_custom_field_list)
        .to have_xpath('/response/links/link')
    end
  end
end
