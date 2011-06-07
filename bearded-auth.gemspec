# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bearded-auth/version"

Gem::Specification.new do |s|
  s.name                  = "bearded-auth"
  s.version               = Bearded::Auth::VERSION
  s.platform              = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.2'
  s.authors               = ["Brett Bender", "Dominic Dagradi"]
  s.email                 = ["brett@bearded.com", "dominic@bearded.com"]
  s.homepage              = "http://bearded.com"
  s.summary               = %q{Bearded authorization and authentication common gems / controllers / models / routes}
  s.description           = %q{TODO: Write a gem description}

  s.rubyforge_project = "bearded-auth"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib", 'app']

  s.add_dependency "devise", '~> 1.2.1'
  s.add_dependency 'oa-oauth', "~> 0.2.0"
  s.add_dependency 'oa-openid', "~> 0.2.0"
end
