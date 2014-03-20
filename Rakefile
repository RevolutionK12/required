require "bundler/gem_tasks"

task :karma_test_prepare do
  desc 'prepare karma'
  sh 'mkdir -p vendor/assets/javascripts'
  Dir.chdir 'vendor/assets/javascripts'
  sh 'ln -fs $(bundle show angularjs-rails)/vendor/assets/javascripts angular'
  sh 'ln -fs $(bundle show requirejs-rails)/vendor/assets/javascripts require'
end

task :push_gem do
  sh 'gem build required.gemspec && gem inabox *.gem && rm *.gem'
end

# extracted from https://github.com/grosser/project_template
rule /^version:bump:.*/ do |t|
  sh "git status | grep 'nothing to commit'" # ensure we are not dirty
  index = ['major', 'minor','patch'].index(t.name.split(':').last)
  file = 'lib/required/version.rb'

  version_file = File.read(file)
  old_version, *version_parts = version_file.match(/(\d+)\.(\d+)\.(\d+)/).to_a
  version_parts[index] = version_parts[index].to_i + 1
  version_parts[2] = 0 if index < 2
  version_parts[1] = 0 if index < 1
  new_version = version_parts * '.'
  File.open(file,'w'){|f| f.write(version_file.sub(old_version, new_version)) }

  # original version -- we aren't committing Gemfile.lock
  # sh "bundle && git add #{file} Gemfile.lock && git commit -m 'bump version to #{new_version}'"
  sh "git add #{file} && git commit -m 'bump version to #{new_version}'"
end
