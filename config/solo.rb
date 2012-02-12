homebase       ENV['CHEF_HOMEBASE'] || File.expand_path("../../homebase", File.dirname(__FILE__))

file_cache_path "/tmp/chef/cache"
cookbook_path   [ File.join(homebase, "cookbooks") ]
