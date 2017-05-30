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
end
