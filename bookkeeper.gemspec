$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bookkeeper/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bookkeeper"
  s.version     = Bookkeeper::VERSION
  s.authors     = ["Tommaso Visconti"]
  s.email       = ["tommaso.visconti@gmail.com"]
  s.homepage    = "http://www.tommyblue.it"
  s.summary     = ""
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.12"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
end
