# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "markerb/version"

Gem::Specification.new do |s|
  s.name        = "markerb"
  s.version     = Markerb::VERSION.dup
  s.platform    = Gem::Platform::RUBY  
  s.summary     = "Multipart templates made easy with Markdown + ERb"
  s.email       = "contact@plataformatec.com.br"
  s.homepage    = "http://github.com/plataformatec/markerb"
  s.description = "Multipart templates made easy with Markdown + ERb"
  s.authors     = ['José Valim']

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "redcarpet"
end