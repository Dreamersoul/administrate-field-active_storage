$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |gem|
  gem.name = "administrate-field-active_storage"
  gem.version = "0.1.8"
  gem.authors = ["Hamad AlGhanim"]
  gem.email = ["hamadyalghanim@gmail.com"]
  gem.homepage = "https://github.com/Dreamersoul/administrate-field-active_storage"
  gem.summary = "Administrate fields for active storage"
  gem.description = gem.summary
  gem.license = "MIT"

  gem.require_paths = ["lib"]
  gem.files = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  gem.add_dependency "administrate", ">= 0.2.0.rc1"
  gem.add_dependency "rails", ">= 5.2"

  gem.add_development_dependency "rspec", "~> 3.4"
end
