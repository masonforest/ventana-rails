$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ventana/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ventana"
  s.version     = Ventana::VERSION
  s.authors     = ["Mason Fischer"]
  s.email       = ["mason@thoughtbot.com"]
  s.homepage    = "https://github.com/thoughtbot/ventana"
  s.summary     = "Ventana is a lightweight rails content management system."
  s.description = "Ventana is a lightweight rails content management system. It allows the developer to specify small blocks of unstructured editable content. This is helpful for landing pages and small blocks for unstructured copy text."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "redcarpet"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara-webkit"
  s.add_development_dependency "launchy"
  s.add_development_dependency "rspec-tag_matchers"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "coffee-script"
  s.add_development_dependency "pry"
end
