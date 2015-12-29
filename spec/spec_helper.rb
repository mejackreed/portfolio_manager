$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'portfolio_manager'
require 'webmock/rspec'
require 'nokogiri'

RSpec::Matchers.define :have_xpath do |xpath|
  match do |str|
    Nokogiri::XML(str).xpath(xpath).any?
  end
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def test_client
  PortfolioManager::REST::Client.new(username: 'user', password: 'pass')
end

def stub_get(path)
  stub_request(:get, /#{stubbed_url + path}/)
end

def stubbed_url
  URI(PortfolioManager::REST::Request::BASE_URL).host +
    PortfolioManager::REST::Request::TEST_PATH
end
