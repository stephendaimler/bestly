# encoding: UTF-8
require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "thumbs_up"
  gem.summary = "Voting for ActiveRecord with multiple vote sources and karma calculation."
  gem.description = "ThumbsUp provides dead-simple voting capabilities to ActiveRecord models with karma calculation, a la stackoverflow.com."
  gem.email = "brady@ldawn.com"
  gem.homepage = "http://github.com/brady8/thumbs_up"
  gem.authors = ["Brady Bouchard", "Peter Jackson", "Cosmin Radoi", "Bence Nagy", "Rob Maddox", "Wojciech Wnętrzak"]
  # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = Dir.glob("test/**/*_test.rb")
  test.verbose = true
end

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "leaderboard #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :default => :test