# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rhp/version"

Gem::Specification.new do |s|
  s.name        = "RHP"
  s.version     = RHP::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Arthur Gunn"]
  s.email       = ["arthur@gunn.co.nz"]
  s.homepage    = ""
  s.summary     = %q{The RHP (or ruby) Hypertext Preprocessor. (VaporWare)}
  s.description = %q{Pages are written in any templating language supported by the tilt gem. Routes are based only on directory structure and file names. Simple!}

  s.add_dependency "rack", "~>1.2.0"
  s.add_dependency "tilt", "~>1.2.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
