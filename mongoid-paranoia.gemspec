$: << File.expand_path('../lib', __FILE__)
require 'mongoid/paranoia/version'

Gem::Specification.new do |gem|
  gem.name          = 'mongoid-paranoia'
  gem.version       = Mongoid::Paranoia::VERSION
  gem.authors       = ['Durran Jordan', 'Mario Uher']
  gem.email         = ['durran@gmail.com', 'uher.mario@gmail.com']
  gem.homepage      = 'https://github.com/haihappen/mongoid-paranoia'
  gem.summary       = 'Extraction of mongoid-paranoia into its own gem.'
  gem.description   = "There may be times when you don't want documents to actually get deleted from the database, but \"flagged\" as deleted."
  gem.licenses      = ['MIT']

  gem.files         = `git ls-files`.split("\n")
  gem.require_path  = 'lib'

  gem.add_dependency 'activesupport', '~> 4.0'
  gem.add_dependency 'mongoid', '>= 4.0.0', '<= 6.0.0'
  gem.add_development_dependency 'mongoid-versioning', '~> 1.1', '>= 1.1.0'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 3'
end
