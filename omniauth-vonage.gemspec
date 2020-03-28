  
require File.expand_path('../lib/omniauth-vonage/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "omniauth-vonage"
  s.version     = OmniAuth::Vonage::VERSION
  s.authors     = ['Alex Vangelov']
  s.email       = ['avangelov@vonage.com']
  s.date        = "2020-03-28"
  s.description = %q{This gem provides OmniAuth strategy for https://developer.vonage.com}
  s.summary     = %q{OmniAuth strategy for Vonage}
  s.homepage    = 'https://github.com/AlexanderVangelov/omniauth-vonage.git'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.required_ruby_version = '>= 2.1.0'

  s.add_dependency 'omniauth', '~> 1.0'
  s.add_dependency 'omniauth-oauth2', '>= 1.5.0'
  s.add_runtime_dependency 'jwt', '>= 2.0'

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
end