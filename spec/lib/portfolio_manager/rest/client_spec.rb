require 'spec_helper'

describe PortfolioManager::REST::Client do
  describe '#initialize' do
    it 'instance variables are set from options keys' do
      client = described_class.new(foo: 'bar')
      expect(client.instance_variable_get('@foo')).to eq 'bar'
    end
    it 'can be configured using a block' do
      client = described_class.new do |config|
        config.username = 'foo'
        config.password = 'bar'
      end
      expect(client.instance_variable_get('@username')).to eq 'foo'
      expect(client.instance_variable_get('@password')).to eq 'bar'
    end
  end
end
