$: << File.join(File.dirname(__FILE__), "lib")

require 'pact/tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:unit) do |t|
  t.pattern = 'spec/**{,/*/**}/unit/*_spec.rb'
end

task :default => 'pact:verify'
