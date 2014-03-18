require "bundler/gem_tasks"

task :karma_test_prepare do
  desc 'prepare karma'
  sh 'mkdir -p vendor/assets/javascripts'
  Dir.chdir 'vendor/assets/javascripts'
  sh 'ln -fs $(bundle show angularjs-rails)/vendor/assets/javascripts angular'
  sh 'ln -fs $(bundle show requirejs-rails)/vendor/assets/javascripts require'
end