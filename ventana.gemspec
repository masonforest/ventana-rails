$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ventana/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ventana"
  s.version     = Ventana::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Ventana."
  s.description = "TODO: Description of Ventana."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "redcarpet"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara-webkit"
  s.add_development_dependency "launchy"
  s.add_development_dependency "rspec-tag_matchers"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "pry"
end
