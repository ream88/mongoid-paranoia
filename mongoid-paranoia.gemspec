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

  gem.add_dependency 'activesupport', '>= 3.0'
  gem.add_dependency 'mongoid', '>= 3.0', '< 3.1.4'
end
