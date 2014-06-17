$: << File.expand_path('../lib', __FILE__)
require 'mongoid/paranoia/version'

Gem::Specification.new do |gem|
  gem.name          = 'mongoid-paranoia'
  gem.version       = Mongoid::Paranoia::VERSION
  gem.authors       = 'Mario Uher'
  gem.email         = 'uher.mario@gmail.com'
  gem.homepage      = 'https://github.com/haihappen/mongoid-paranoia'
  gem.summary       = 'Extraction of mongoid-paranoia into its own gem.'
  gem.description   = "There may be times when you don't want documents to actually get deleted from the database, but \"flagged\" as deleted."

  gem.files         = `git ls-files`.split("\n")
  gem.require_path  = 'lib'

  gem.add_dependency 'activesupport'
  gem.add_dependency 'mongoid', '~> 4.0.0.rc2'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 2.14'
end
