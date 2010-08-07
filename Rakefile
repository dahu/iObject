task :default => :test

task :test => [:test_numbers]

task :test_numbers do |t|
  sh "~/.vim/bin/runVimTests.sh test/test_numbers*.vim"
end
