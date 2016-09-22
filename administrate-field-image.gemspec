$:.push File.expand_path("../lib", __FILE__)

require "administrate/field/image"

Gem::Specification.new do |gem|
  gem.name = "administrate-field-image"
  gem.version = Administrate::Field::Image::VERSION
  gem.authors = ["Grayson Wright"]
  gem.email = ["wright.grayson@gmail.com"]
  gem.homepage = "https://github.com/graysonwright/administrate-field-image"
  gem.summary = "Official Image field plugin for Administrate"
  gem.description = gem.summary
  gem.license = "MIT"

  gem.require_paths = ["lib"]
  gem.files = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  gem.add_dependency "administrate", ">= 0.2.0.rc1", "< 0.3.0"
  gem.add_dependency "rails", "~> 4.2"

  gem.add_development_dependency "rspec", "~> 3.4"
end
