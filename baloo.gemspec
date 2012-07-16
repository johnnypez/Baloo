# -*- encoding: utf-8 -*-
require File.expand_path('../lib/baloo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["John Butler"]
  gem.email         = ["johnnypez@gmail.com"]
  gem.description   = %q{The simple 'bear' necessities for working with graph.facebook.com}
  gem.summary       = %q{A simple Facebook Graph client}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "baloo"
  gem.require_paths = ["lib"]
  gem.version       = Baloo::VERSION

  gem.add_dependency "httparty"
  gem.add_dependency "activesupport"
end
