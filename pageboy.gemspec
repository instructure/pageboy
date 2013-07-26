# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pageboy/version'

Gem::Specification.new do |gem|
  gem.authors =       ["Duane Johnson"]
  gem.email =         ["duane@instructure.com"]
  gem.description =   %q{Paginator}
  gem.summary =       %q{Paginator for collections of unknown size}

  gem.files = %w[pageboy.gemspec]
  gem.files += Dir.glob("lib/**/*.rb")
  gem.files += Dir.glob("spec/**/*")
  gem.test_files    = Dir.glob("spec/**/*")
  gem.name          = "pageboy"
  gem.require_paths = ["lib"]
  gem.version       = Pageboy::VERSION

  gem.add_development_dependency "bundler", ">= 1.0.0"
  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_development_dependency "webmock"
  gem.add_development_dependency "debugger"

  # Used for configuration on modules and classes
  gem.add_dependency "activesupport", ">= 3.0.0"

  # HTTP library
  gem.add_dependency "faraday", "~> 0.8.8"

  # Parses Link headers formatted according to RFC 5988 draft spec
  gem.add_dependency "link_header", ">= 0.0.7"
end