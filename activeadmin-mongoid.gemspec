# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_admin/mongoid/version'

Gem::Specification.new do |gem|
  gem.authors       = ['Elia Schito']
  gem.email         = ['elia@schito.me']
  gem.description   = %q{ActiveAdmin hacks to support Mongoid (some ActiveAdmin features are disabled)}
  gem.summary       = %q{ActiveAdmin hacks to support Mongoid}
  gem.homepage      = ''

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'activeadmin-mongoid'
  gem.require_paths = ['lib']
  gem.version       = ActiveAdmin::Mongoid::VERSION
  gem.license       = 'MIT'

  gem.add_runtime_dependency 'rails',       '~> 4.1'
  gem.add_runtime_dependency 'mongoid',     ['>= 4.0.0', '< 4.1']
  gem.add_runtime_dependency 'activeadmin', ['>= 1.0.0.pre', '< 1.1']
  gem.add_runtime_dependency 'devise', ['>= 3.2.4', '< 3.3']
  gem.add_runtime_dependency 'ransack_mongo', ['>= 0.0.1', '< 0.1']

  gem.add_development_dependency 'rspec-rails',  '~> 2.7'
end
