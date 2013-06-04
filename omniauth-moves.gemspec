# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-moves/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nick Elser"]
  gem.email         = ["nick.elser@gmail.com"]
  gem.description   = %q{OmniAuth strategy for Moves.}
  gem.summary       = %q{OmniAuth strategy for Moves.}
  gem.homepage      = "https://github.com/nickelser/omniauth-moves"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-moves"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Moves::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_dependency 'multi_json', '~> 1.0'

  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
end
