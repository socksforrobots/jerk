# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jerk/version'

Gem::Specification.new do |gem|
  gem.name          = "jerk"
  gem.version       = Jerk::VERSION
  gem.authors       = ["Corey Ward"]
  gem.email         = ["corey.atx@gmail.com"]
  gem.description   = %q{Jerk is insensitive, particularly about URL casing.}
  gem.summary       = %q{Jerk is middleware that prevents any uppercase URLs from making it through in the path of a URL.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rack'
end
