Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_google_merchant'
  s.version     = '1.1.0.alpha'
  s.summary     = 'Google Merchant RSS feed for Solidus 1.1'
  s.description = 'Google Merchant RSS feed for Solidus 1.1'
  s.required_ruby_version = '>= 2.0.0'

  s.author   = 'Tim Neems, sebastyuiop, Ben Radler, End Point Corp. (Solidus Migration)'
  s.email    = 'ask@endpoint.com'
  s.homepage = 'http://solidus.io'
  s.license  = %q{BSD-3}

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'solidus_core'
  s.add_dependency 'solidus_api'
  s.add_dependency 'solidus_backend'

  s.add_development_dependency 'factory_girl_rails', '~> 4.5.0'
  s.add_development_dependency 'rspec-rails', '~> 3.4.0'
  s.add_development_dependency 'capybara', '~> 2.6.0'
  s.add_development_dependency 'launchy', '~> 2.4.3'
  s.add_development_dependency 'sass-rails', '~> 5.0.4'
  s.add_development_dependency 'coffee-rails', '~> 4.1.1'
  s.add_development_dependency 'email_spec', '~> 2.0.0'
  s.add_development_dependency 'ffaker', '~> 1.32'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1.0'
  s.add_development_dependency 'database_cleaner', '~> 1.0.1'
  s.add_development_dependency 'poltergeist', '~> 1.8.1'
end
