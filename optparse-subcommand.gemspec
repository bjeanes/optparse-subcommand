# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "optparse-subcommand"
  s.version = "1.0.0.pre"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bodaniel Jeanes"]
  s.autorequire = "optparse/subcommand"
  s.date = "2012-04-15"
  s.description = "Add subcommand parsing to Ruby's OptionParser class"
  s.email = "me@bjeanes.com"
  s.files = ["LICENSE", "README.md", "lib/optparse", "lib/optparse/subcommand.rb", "spec/optparse", "spec/optparse/subcommand_spec.rb"]
  s.homepage = "http://github.com/bjeanes/optparse-subcommand"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Add subcommand parsing to Ruby's OptionParser class"
  s.test_files = ["spec/optparse", "spec/optparse/subcommand_spec.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["= 2.9.0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["= 2.9.0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["= 2.9.0"])
  end
end
