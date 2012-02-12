#
# sudo chown -R `whoami`:staff /usr/local
 

namespace :install do

  desc "Install required gems on host machine"
  task :bundler do
    sh 'bundle install' 
  end

  desc "Install chef server on host machine"
  task :chef_server do
    sh 'chef-solo -c config/solo.rb -j config/bootstrap-chef-server.json' 
  end

  desc "Set up host machine as a chef client"
  task :chef_client do
    sh 'chef-solo -c config/solo.rb -j config/bootstrap-chef-server.json' 
  end
  
end
task :install => [
  'install:bundler',
  'install:chef_server',
  'install:chef_client'
]

task :default do
  puts %Q{This is the continuous integration setup that we use to ensure bulletproof architecture construction on the Infochimps platform (http://infochimps.com). Run rake -T to list tasks -- you may wish to start with

  gem install bundler
  rake install

To use vagrant 0.9+, run

  gem install bundler
  rake install USE_VAGRANT_09=true

Enjoy!
}
end
