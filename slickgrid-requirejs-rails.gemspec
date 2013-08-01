$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'slickgrid-requirejs-rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'slickgrid-requirejs-rails'
  s.version     = SlickgridRequirejsRails::VERSION
  s.authors     = ['Bogumil Wrona']
  s.email       = ['b.wrona@cre8newmedia.com']
  s.homepage    = 'https://github.com/bogwro/slickgrid-requirejs-rails'
  s.summary     = 'SlickGrid Integration for Rails and RequireJS'
  s.description = 'SlickGrid Integration for Rails and RequireJS'

  s.license = 'MIT'

  s.files = Dir['{app,config,db,lib,vendor}/**/*'] + %w(MIT-LICENSE Rakefile README.md)
  s.test_files = Dir['test/**/*']

  s.add_dependency 'railties', '>= 3.1.1'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'requirejs-rails'

  s.add_development_dependency 'rails', '>= 3.1.1'
  #s.add_development_dependency 'sqlite3'
end
