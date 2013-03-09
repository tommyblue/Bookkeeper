$:.push File.expand_path("../lib", __FILE__)

require "bookkeeper/version"

Gem::Specification.new do |s|
  s.name        = "bookkeeper"
  s.version     = Bookkeeper::VERSION
  s.authors     = ["Tommaso Visconti"]
  s.email       = ["tommaso.visconti@gmail.com"]
  s.homepage    = "https://github.com/tommyblue/Bookkeeper"
  s.summary     = "Bookkeeper add the possibility to store purchases and their receipts to a Rails application"
  s.description = "Bokkeeper is a Rails mountable engine with Twitter Bootstrap compatible markup."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
  s.add_dependency 'validates_timeliness', '~> 3.0'
  s.add_dependency 'carrierwave', '~> 0.8.0'
  s.add_dependency 'simple_form', '~> 2.0.4'

  s.add_development_dependency 'pry'
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "faker"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rb-fsevent", "~> 0.9.1"
  s.add_development_dependency "growl"
end
