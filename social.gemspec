$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "social/version"

# CAACocu2J5L4BAPrpOwZBuTZB9SZAZAviO61reP8jMUkTFGfjgEfb7zqTdOKRhpaXwApTKXJSkoGb9e9wmkmK1s3SLv7w6Ynw4laZCenm7kzHHUlQAS1Jfvm7JwrHBaAJYljqt4NrzmZCkZCyM29KqLq

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
	s.name        = "social"
	s.version     = Social::VERSION
	s.authors     = ["Noah Portes Chaikin"]
	s.email       = ["noah@porteschaikin.com"]
	s.homepage    = "http://www.kingandpartners.com/"
	s.summary     = "Summary of Social."
	s.description = "Description of Social."

	s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
	s.test_files = Dir["test/**/*"]

	s.add_dependency "rails", ">= 3.2.13"
	s.add_dependency "koala"
	s.add_dependency "twitter"
	s.add_dependency "instagram"
	s.add_dependency "paperclip"
	s.add_dependency "protected_attributes"

	s.add_development_dependency "sqlite3"
end
