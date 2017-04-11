require 'bundler/gem_tasks'

Rake::Task[:build].enhance [ :gemspec ]

require 'rake/clean'
CLEAN.include 'tmp'

desc "Generate gemspec"
task :gemspec do
  require 'rubygems/specification'
  require 'date'

  spec = Gem::Specification.new do |s|
    s.specification_version = 3 if s.respond_to? :specification_version=
    s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

    s.author            = "Bo Jeanes"
    s.email             = "me@bjeanes.com"

    s.name              = 'optparse-subcommand'
    s.version           = '1.0.0'
    s.summary           = 'Add subcommand parsing to Ruby\'s OptionParser class'
    s.description       = s.summary
    s.homepage          = 'http://github.com/bjeanes/optparse-subcommand'

    s.date              = Date.today.strftime

    s.files             = %w(LICENSE README.md) + Dir.glob("{lib,spec}/**/*")
    s.license           = "MIT"
    s.require_paths     = %w[lib]
    s.test_files        = s.files.select { |path| path =~ /^spec\// }
    s.autorequire       = "optparse/subcommand"
    s.has_rdoc          = false

    s.add_development_dependency "rake", "~> 0"
    s.add_development_dependency "rspec", "2.9.0"
    s.add_development_dependency "test-unit"
  end

  File.open("optparse-subcommand.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

namespace :test do
  tag = "v#{RUBY_VERSION.gsub(/\./,'_')}"
  ruby_dir = "tmp/ruby/#{tag}"

  file ruby_dir do
    sh "git clone --branch=#{tag} --depth=1 https://github.com/ruby/ruby #{ruby_dir}" do |ok, res|
      next if ok

      puts "#{res}"
      tag << '_0'
      sh "git clone --branch=#{tag} --depth=1 https://github.com/ruby/ruby #{ruby_dir}"
    end
  end

  require 'rake/testtask'
  Rake::TestTask.new(:stdlib => ruby_dir) do |t|
    # ensure subcommand is loaded to catch monkey-patch errors
    t.test_files = FileList['lib/optparse/subcommand', "#{ruby_dir}/test/optparse/test_*.rb"]
    t.verbose = true
  end
end

task :default => [ :spec, 'test:stdlib' ]
