# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rhp/version"

Gem::Specification.new do |s|
  s.name        = "RHP"
  s.version     = Rhp::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Arthur Gunn"]
  s.email       = ["arthur@gunn.co.nz"]
  s.homepage    = ""
  s.summary     = %q{The RHP (or ruby) Hypertext Preprocessor.}
  s.description = %q{Pages are written in erb or, if the tilt gem is installed, anything it provides. Routes are based only on directory structure and file names. Simple!}

  s.rubyforge_project = "rhp"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
