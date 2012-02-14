require 'rubygems' unless defined?(Gem)
require 'bundler'
require 'rake'

require 'chef'

def IRONFAN_CI_DIR(*path) File.expand_path(File.join(*path), File.dirname(__FILE__)) end

unless ENV['CHEF_ORGANIZATION'] && ENV['CHEF_HOMEBASE'] && ENV['CHEF_USER']
  Chef::Log.warn %Q{Please set these environment variables:\n\n* CHEF_ORGANIZATION (got '#{ENV['CHEF_ORGANIZATION']}') chef server organization name\n* CHEF_USER         (got '#{ENV['CHEF_USER']}') chef server username\n* CHEF_HOMEBASE     (got '#{ENV['CHEF_HOMEBASE']}') folder holding cookbooks/, roles/, etc dirs\n\n}
  # add a line like this to your ~/.bashrc or whatever: export CHEF_ORGANIZATION=cocina CHEF_USER=chimpy CHEF_HOMEBASE=~/homebase
  raise("One of the CHEF_ORGANIZATION, CHEF_USER, or CHEF_HOMEBASE environment variables is missing.")
end

CHEF_ORGANIZATION = ENV['CHEF_ORGANIZATION']
CHEF_HOMEBASE     = ENV['CHEF_HOMEBASE']
CHEF_USER         = ENV['CHEF_USER']

Dir[IRONFAN_CI_DIR("tasks/*.rake")].each do |rakefile|
  load(rakefile)
end
