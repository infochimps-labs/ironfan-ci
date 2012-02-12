#
# sudo chown -R `whoami`:staff /usr/local
 

namespace :install do

  desc "Install required gems on host machine"
  task :bundler do
    sh 'bundle install' 
  end

  desc "Install chef server on host machine"
  task :chef_server do
    sh 'chef-solo -c config/solo.rb -j config/bootstrap-chef-server.json -l info'
    # sh 'sudo chown  -R chef /usr/local/var/{lib/couchdb,lib/rabbitmq,log/couchdb,log/rabbitmq,run/couchdb} /var/chef/solr '
    # for foo in expander solr webui ; do echo $foo ; sudo ln -nfs server.rb  /etc/chef/$foo.rb ; done
    sh 'sudo -u chef foreman start -f /etc/chef/Procfile-chef-backend' ; sleep 2
    sh 'sudo -u chef foreman start -f /etc/chef/Procfile-chef-server'
    # ps axu | egrep 'ruby|chef'
  end

  # desc "Set up host machine as a chef client"
  # task :chef_client do
  #   sh 'chef-solo -c config/solo.rb -j config/bootstrap-chef-server.json' 
  # end
  
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
  rake install VAGRANT_VERSION=9

Enjoy!
}
end
