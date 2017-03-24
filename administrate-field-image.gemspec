$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |gem|
  gem.name = "administrate-field-image"
  gem.version = "1.0.0"
  gem.authors = ["Grayson Wright", "Nick Charlton"]
  gem.email = ["wright.grayson@gmail.com", "nick@nickcharlton.net"]
  gem.homepage = "https://github.com/graysonwright/administrate-field-image"
  gem.summary = "Official Image field plugin for Administrate"
  gem.description = gem.summary
  gem.license = "MIT"

  gem.require_paths = ["lib"]
  gem.files = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  gem.add_dependency "administrate", ">= 0.2.0.rc1"

  gem.add_development_dependency "rspec", "~> 3.4"
end
