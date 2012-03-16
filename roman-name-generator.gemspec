# -*- encoding: utf-8 -*-
require File.expand_path('../lib/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["James OKelly"]
  gem.email         = ["james@rubyloves.me"]
  gem.description   = %q{A fun generator to generate ancient roman names}
  gem.summary       = %q{A fun generator to generate ancient roman names}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "roman-name-generator"
  gem.require_paths = ["lib"]
  gem.version       = RomanNameGenerator::VERSION
end
