# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bearded-auth/version"

Gem::Specification.new do |s|
  s.name        = "bearded-auth"
  s.version     = Bearded::Auth::VERSION
  s.authors     = ["Brett Bender"]
  s.email       = ["brett@bearded.com"]
  s.homepage    = "http://bearded.com"
  s.summary     = %q{Bearded authorization and authentication common gems / controllers / models / routes}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "bearded-auth"

  s.add_dependency 'devise', ">= 1.3.4"
  s.add_dependency 'oa-oauth', "~> 0.2.0"
  s.add_dependency 'oa-openid', "~> 0.2.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
