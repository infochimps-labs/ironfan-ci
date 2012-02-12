source "http://rubygems.org"

if ENV['USE_VAGRANT_09']
  puts "Using vagrant 0.9+, which will require pre-release (as of Feb 2012) version 0.10.9+ of chef"
end

gem 'chef',          "= 0.10.8"  unless ENV['USE_VAGRANT_09']
gem 'cluster_chef',  "~> 3.0.12"

gem 'soloist'

gem 'rake'
gem 'bundler',     "~> 1"
gem 'rspec',       "~> 2.5"

if ENV['USE_VAGRANT_09']
  gem 'chef',       "= 0.10.9"
  gem 'vagrant',    "~> 0.9.7"
  gem 'veewee',     "~> 0.2.3"
else
  gem 'vagrant',    "~> 0.8"
  gem 'veewee',     "= 0.2.2"
end

group :development do
  gem 'yard',        "~> 0.6"
end

group :support do
  gem 'pry'  # useful in debugging
  gem 'grit' # used in rake scripts for push/pulling cookbooks
end
