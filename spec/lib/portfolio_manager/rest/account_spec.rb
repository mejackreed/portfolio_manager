require 'spec_helper'

describe PortfolioManager::REST::Account do
  let(:client) { test_client }
  describe '#account' do
    before do
      stub_get('/account').to_return(body: fixture('account.xml'))
    end
    it 'returns an account element' do
      expect(client.account['account'])
        .to include 'id', 'contact', 'organization'
    end
  end
  describe '#property_list' do
    let(:id) { 680_01 }
    before do
      stub_get("/account/#{id}/property/list")
        .to_return(body: fixture('property_list.xml'))
    end
    it 'returns a list of properties' do
      client.property_list(id)['response']['links']['link'].each do |link|
        expect(link).to include '@id', '@link'
      end
    end
  end
end
