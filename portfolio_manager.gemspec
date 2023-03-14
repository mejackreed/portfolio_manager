# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'portfolio_manager/version'

Gem::Specification.new do |spec|
  spec.name          = 'portfolio_manager'
  spec.version       = PortfolioManager::VERSION
  spec.authors       = ['Jack Reed']
  spec.email         = ['phillipjreed@gmail.com']

  spec.summary       = 'A Ruby client for the EnergyStar Portfolio Manager web services.'
  spec.description   = 'A Ruby client for the EnergyStar Portfolio Manager web services.'
  spec.homepage      = 'https://github.com/mejackreed/portfolio_manager'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday-xml'
  spec.add_dependency 'nokogiri'
  spec.add_dependency 'nori'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
