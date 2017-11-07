$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mailtime/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mailtime"
  s.version     = Mailtime::VERSION
  s.authors     = ["Josh Brody"]
  s.email       = ["josh@josh.mn"]
  s.homepage    = ""
  s.summary     = "Summary of Mailtime."
  s.description = "Description of Mailtime."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.9"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "database_cleaner"
end
