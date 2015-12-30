require 'spec_helper'

describe PortfolioManager::REST::Building do
  let(:client) { test_client }
  describe '#building_list' do
    let(:id) { 680_01 }
    before do
      stub_get("/property/#{id}/building/list")
        .to_return(body: fixture('building_list.xml'))
    end
    it 'returns a list of buidings' do
      client.building_list(id)['response']['links']['link'].each do |link|
        expect(link).to include '@link'
      end
    end
  end
  describe '#building' do
    let(:id) { 680_01 }
    before do
      stub_get("/building/#{id}")
        .to_return(body: fixture('building.xml'))
    end
    it 'returns a building' do
      expect(client.building(id)['building'])
        .to include 'name', 'address', 'constructionStatus', 'yearBuilt', 'grossFloorArea', 'occupancyPercentage'
    end
  end
end
