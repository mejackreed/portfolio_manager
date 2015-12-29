require 'spec_helper'

describe PortfolioManager::REST::Account do
  let(:client) { test_client }
  describe '#account' do
    before do
      stub_get('/account').to_return(body: fixture('account.xml'))
    end
    it 'returns an account element' do
      expect(client.account).to have_xpath('/account')
    end
  end
end
