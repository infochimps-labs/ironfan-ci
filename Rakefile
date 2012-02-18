require 'rubygems' unless defined?(Gem)
require 'bundler'
require 'rake'

require 'chef'

def IRONFAN_CI_DIR(*path) File.expand_path(File.join(*path), File.dirname(__FILE__)) end

Dir[IRONFAN_CI_DIR("tasks/*.rake")].each do |rakefile|
  load(rakefile)
end
