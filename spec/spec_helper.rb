# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'portfolio_manager'
require 'webmock/rspec'
require 'coveralls'

Coveralls.wear!

def fixture(file)
  File.new("#{fixture_path}/#{file}")
end

def fixture_path
  File.expand_path('fixtures', __dir__)
end

def test_client
  PortfolioManager::REST::Client.new(username: 'user', password: 'pass')
end

def stub_get(path)
  stub_request(:get, /#{stubbed_url + path}/)
end

def stub_post(path)
  stub_request(:post, /#{stubbed_url + path}/)
end

def stubbed_url
  URI(PortfolioManager::REST::Request::BASE_URL).host +
    PortfolioManager::REST::Request::TEST_PATH
end
