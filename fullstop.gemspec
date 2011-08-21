# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fullstop/version"

Gem::Specification.new do |s|
  s.name        = "fullstop"
  s.version     = Fullstop::VERSION
  s.authors     = ["Dave Copeland"]
  s.email       = ["davetron5000@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Manage your dotfiles}
  s.description = %q{Manage your dotfiles}

  s.rubyforge_project = "fullstop"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency("aruba")
end
