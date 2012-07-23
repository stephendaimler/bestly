# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "thumbs_up"
  s.version = "0.4.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brady Bouchard", "Peter Jackson", "Cosmin Radoi", "Bence Nagy", "Rob Maddox", "Wojciech Wnetrzak"]
  s.date = "2011-09-15"
  s.description = "ThumbsUp provides dead-simple voting capabilities to ActiveRecord models with karma calculation, a la stackoverflow.com."
  s.email = "brady@ldawn.com"
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["README.markdown"]
  s.homepage = "http://github.com/brady8/thumbs_up"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Voting for ActiveRecord with multiple vote sources and karma calculation."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end
