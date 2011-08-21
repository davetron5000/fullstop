require 'bundler/gem_tasks'
require 'rake/clean'
require 'cucumber/rake/task'

Bundler::GemHelper.install_tasks

CUKE_RESULTS = 'results.html'
CLEAN << CUKE_RESULTS
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format html -o #{CUKE_RESULTS} --format progress -x"
  t.fork = false
end

task :default => :features
