source "http://rubygems.org"

#
# Chef + Vagrant
#

gem 'chef',            "= 0.10.10"
gem 'ironfan',         "~> 3.1.5"
gem 'vagrant',         "~> 1.0"
gem 'veewee',          "~> 0.2"
gem 'fog',             "~> 1.3"

#
# Test drivers
#

gem 'rake'
gem 'bundler',     "~> 1"
gem 'rspec',       "~> 2.5"
gem 'cucumber'
# submoduled to vendor/hedgehog/cuken
# gem 'cuken',    :git => "http://github.com/infochimps/cuken.git"

#
# Development
#

group :development do
  gem 'yard',        "~> 0.6"
  gem 'jeweler'

  gem 'ruby_gntp' # is this cross-OS? if not, how do I specify that?
  #
  gem 'guard'
  gem 'guard-process'
  gem 'guard-chef'
  gem 'guard-cucumber'
end

group :support do
  gem 'pry'  # useful in debugging
  gem 'grit' # used in rake scripts for push/pulling cookbooks
end

#
# Chef & CI Infrastructure
#

group :chef_server do
  gem 'chef-solr',         "= 0.10.10"
  gem 'chef-server-api',   "= 0.10.10"
  gem 'chef-server-webui', "= 0.10.10"
  # fuckin'a -- find-grained gem dependencies go in the app, not the gem
  # gem 'chef-expander',     "= 0.10.10"
  gem 'foreman'
end
