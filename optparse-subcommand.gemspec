# -*- encoding: utf-8 -*-
# stub: optparse-subcommand 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "optparse-subcommand".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bo Jeanes".freeze]
  s.autorequire = "optparse/subcommand".freeze
  s.date = "2017-04-20"
  s.description = "Add subcommand parsing to Ruby's OptionParser class".freeze
  s.email = "me@bjeanes.com".freeze
  s.files = ["LICENSE".freeze, "README.md".freeze, "lib/optparse".freeze, "lib/optparse/subcommand.rb".freeze, "spec/optparse".freeze, "spec/optparse/subcommand_spec.rb".freeze]
  s.homepage = "http://github.com/bjeanes/optparse-subcommand".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Add subcommand parsing to Ruby's OptionParser class".freeze
  s.test_files = ["spec/optparse".freeze, "spec/optparse/subcommand_spec.rb".freeze]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, ["~> 12.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<test-unit>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 0"])
  end
end
