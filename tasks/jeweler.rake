# require 'jeweler'
# Jeweler::Tasks.new do |gem|
#   gem.name        = "ironfan-ci"
#   gem.homepage    = "http://infochimps.com/labs"
#   gem.license     = :apachev2
#   gem.summary     = %Q{Continuous Integration testing of ironfan clusters and chef cookbooks. Pass your system diagram into iron law.}
#   gem.description = %Q{Continuous Integration testing of ironfan clusters and chef cookbooks. Pass your system diagram into iron law.}
#   gem.email       = "coders@infochimps.org"
#   gem.authors     = ["infochimps"]
#   # dependencies defined in Gemfile
#
#   ignores = File.readlines(".gitignore").grep(/^[^#]\S+/).map{|s| s.chomp }
#   dotfiles = [".gemtest", ".gitignore", ".rspec", ".yardopts"]
#   gem.files = dotfiles + Dir["**/*"].
#     reject{|f| f =~ %r{^cookbooks/} }.
#     reject{|f| File.directory?(f) }.
#     reject{|f| ignores.any?{|i| File.fnmatch(i, f) || File.fnmatch(i+'/*', f) || File.fnmatch(i+'/**/*', f) } }
#   gem.test_files = gem.files.grep(/^spec\//)
#   gem.require_paths = ['lib']
#
# end
# Jeweler::RubygemsDotOrgTasks.new
#
# require 'yard'
# YARD::Rake::YardocTask.new
