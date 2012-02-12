source "http://rubygems.org"

vagrant_version = "9" # (ENV['VAGRANT_VERSION'] == "9")
chef_version    = "= 0.10.8"
if vagrant_version
  puts "Using vagrant 0.9+, which will require pre-release (as of Feb 2012) version 0.10.9+ of chef"
end

gem 'chef',          chef_version
gem 'cluster_chef',  "~> 3.0.12"

gem 'rake'
gem 'bundler',     "~> 1"
gem 'rspec',       "~> 2.5"

if vagrant_version == "9"
  gem 'vagrant',    "~> 0.9.7"
  gem 'veewee',     "~> 0.2.3"
else
  gem 'vagrant',    "~> 0.8"
  gem 'veewee',     "= 0.2.2"
end

group :chef_server do
  gem 'chef-solr',         chef_version
  gem 'chef-server-api',   chef_version
  gem 'chef-server-webui', chef_version
  gem 'chef-expander',     chef_version
  gem 'foreman'
end

group :development do
  gem 'yard',        "~> 0.6"
end

group :support do
  gem 'pry'  # useful in debugging
  gem 'grit' # used in rake scripts for push/pulling cookbooks
end
