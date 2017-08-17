require 'spec_helper'

describe PortfolioManager::REST::Share do
  let(:client) { test_client }
  
  describe '#pending_share' do
    context 'property' do
      before do
        stub_get('/share/property/pending/list')
          .to_return(body: fixture('property_pending_list.xml'))
      end

      it 'returns a list of pending property shares' do
        client.pending_property_shares['pendingList']['property'].each do |property|
          expect(property).to include 'propertyId', 'customFieldList', 'accessLevel', 'accountId', 'propertyInfo', 'shareAudit'
        end
      end
    end

    context 'meter' do
      before do
        stub_get('/share/meter/pending/list')
          .to_return(body: fixture('meter_pending_list.xml'))
      end

      it 'returns a list of pending meter shares' do
        client.pending_meter_shares['pendingList']['meter'].each do |meter|
          expect(meter).to include 'meterId', 'meterInfo', 'propertyId', 'customFieldList', 'accessLevel', 'accountId', 'propertyInfo', 'shareAudit'
        end
      end
    end
  end

  describe '#share' do
    let(:id) { 68001 }

    context 'property' do
      context 'when accepting share' do
        before do
          stub_post("/share/property/#{id}")
            .with(body: fixture('property_share_accept.xml').read, headers: { 'Content-Type'=>'application/xml' })
            .to_return(body: fixture('response_status_ok.xml'))
        end

        it 'returns status OK' do
          expect(client.property_share_request(id)['response']['@status']).to eq('Ok')
        end
      end

      context 'when rejecting share' do
        before do
          stub_post("/share/property/#{id}")
            .with(body: fixture('property_share_reject.xml').read, headers: { 'Content-Type'=>'application/xml' })
            .to_return(body: fixture('response_status_ok.xml'))
        end

        it 'returns status OK' do
          expect(client.property_share_request(id, false)['response']['@status']).to eq('Ok')
        end
      end
    end

    context 'meter' do
      context 'when accepting share' do
        before do
          stub_post("/share/meter/#{id}")
            .with(body: fixture('meter_share_accept.xml').read, headers: { 'Content-Type'=>'application/xml' })
            .to_return(body: fixture('response_status_ok.xml'))
        end

        it 'returns status OK' do
          expect(client.meter_share_request(id)['response']['@status']).to eq('Ok')
        end
      end

      context 'when rejecting share' do
        before do
          stub_post("/share/meter/#{id}")
            .with(body: fixture('meter_share_reject.xml').read, headers: { 'Content-Type'=>'application/xml' })
            .to_return(body: fixture('response_status_ok.xml'))
        end

        it 'returns status OK' do
          expect(client.meter_share_request(id, false)['response']['@status']).to eq('Ok')
        end
      end
    end
  end
end
