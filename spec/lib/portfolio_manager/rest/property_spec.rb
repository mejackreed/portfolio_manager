require 'spec_helper'

describe PortfolioManager::REST::Property do
  let(:client) { test_client }
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
