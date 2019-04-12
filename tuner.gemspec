lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tuner/version'

Gem::Specification.new do |s|
  s.add_development_dependency "rspec", '~> 3.7', '>= 3.7.0'
  s.name        = 'tuner'
  s.version     = Tuner::Version
  s.date        = '2019-03-23'
  s.summary     = "A pure implementation of Decorator pattern"
  s.description = "A pure implementation of Decorator pattern"
  s.authors     = ["Paweł Dąbrowski"]
  s.email       = 'dziamber@gmail.com'
  s.files       = Dir['lib/**/*.rb', 'spec/helper.rb']
end
