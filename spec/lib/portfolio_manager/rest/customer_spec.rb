require 'spec_helper'

describe PortfolioManager::REST::Customer do
  let(:client) { test_client }
  describe '#customer_list' do
    before do
      stub_get("/customer/list")
        .to_return(body: fixture('customer_list.xml'))
    end

    it 'returns a list of customers' do
      client.customer_list['response']['links']['link'].each do |link|
        expect(link).to include '@id', '@link'
      end
    end
  end

  describe '#customer' do
    let(:id) { 68001 }
    before do
      stub_get("/customer/#{id}")
        .to_return(body: fixture('customer.xml'))
    end
    it 'returns a customer' do
      expect(client.customer(id)['customer'])
        .to include 'username', 'accountInfo', 'includeTestPropertiesInGraphics'
    end
  end
end
