# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-html-matchers"
  spec.version       = RSpecJavascriptMatchers::Version
  spec.authors       = ["Nikita Fedyashev"]
  spec.email         = ["nfedyashev@gmail.com"]
  spec.summary       = %q{RSpec matchers for checking if your Javascript UJS response is valid Javascript code}
  spec.homepage      = "https://github.com/nfedyashev/rspec-javascript-matchers.rb"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*', '*.md', '*.gemspec', 'Gemfile', 'Rakefile']

  spec.files         = Dir['{lib,spec}/**/*', '*.md', '*.gemspec', 'Gemfile', 'Rakefile']
  spec.test_files    = spec.files.grep(%r{^spec/})

  spec.required_ruby_version     = Gem::Requirement.new('>= 1.9.3')
  spec.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')

  spec.add_dependency 'pry'
  spec.add_dependency 'rspec'
  spec.add_dependency 'therubyracer', '=0.12.3'
  #spec.add_dependency 'jshintrb'

  spec.add_development_dependency "bundler", "~> 1.0"
  spec.add_development_dependency 'rake', '~> 10'
end
