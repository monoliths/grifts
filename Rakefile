require 'bundler/gem_tasks'
require 'rake/testtask'

task default:  :spec

Rake::TestTask.new do |t|
  t.libs << "tests"
  t.test_files = FileList['tests/test*.rb']
  t.verbose = true
end
