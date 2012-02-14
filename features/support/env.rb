#!/usr/bin/env ruby
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

def IRONFAN_CI_DIR(*segs) File.expand_path(File.join(*segs), File.expand_path("../..", File.dirname(__FILE__))) ; end

$LOAD_PATH.unshift(IRONFAN_CI_DIR('vendor/hedgehog/cuken/lib'))

require 'rspec/expectations'

# require 'webrat/adapters/mechanize'
# require 'webrat_logging_patches'
# World do
#   Webrat::Session.new(Webrat::MechanizeAdapter.new)
# end

require 'cuken'
