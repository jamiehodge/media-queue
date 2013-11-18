require "rake/testtask"

require_relative "lib/media/queue/rake"

Rake::TestTask.new do |t|
  t.libs << "lib" << "test"
  t.test_files = FileList["test/**/test_*.rb"]
end
