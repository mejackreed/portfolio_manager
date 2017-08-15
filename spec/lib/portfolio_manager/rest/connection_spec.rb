require 'spec_helper'

describe PortfolioManager::REST::Connection do
  let(:client) { test_client }
  
  describe '#pending_list' do
    before do
      stub_get('/connect/account/pending/list')
        .to_return(body: fixture('pending_list.xml'))
    end
    it 'returns a list of pending connections' do
      client.pending_list['pendingList']['account'].each do |account|
        expect(account).to include 'accountInfo', 'accountId', 'customFieldList', 'customFieldList', 'connectionAudit'
      end
    end
  end

  describe '#connection' do
    let(:id) { 68001 }

    context 'when accepting a connection' do
      before do
        stub_post("/connect/account/#{id}")
          .with(body: fixture('connection_accept.xml').read, headers: { 'Content-Type'=>'application/xml' })
          .to_return(body: fixture('connection.xml'))
      end

      it 'returns status OK' do
        expect(client.connection(id)['response']['@status']).to eq('Ok')
      end
    end

    context 'when rejecting a connection' do
      before do
        stub_post("/connect/account/#{id}")
          .with(body: fixture('connection_reject.xml').read, headers: { 'Content-Type'=>'application/xml' })
          .to_return(body: fixture('connection.xml'))
      end

      it 'returns status OK' do
        expect(client.connection(id, false)['response']['@status']).to eq('Ok')
      end
    end
  end
end
