You can use [VeeWee](https://raw.github.com/jedi4ever/veewee/),
[Vagrant](http://vagrantup.com) and
[Virtualbox](http://download.virtualbox.org/virtualbox/) to make chef
development ridiculously funner.

### Testing homebase

Just need the vagrants, no knife or anything -- 

* chef server username is runner username
* looks in `~/.chef/{username}.pem` for user key
* looks in `~/.chef/{organization}-testing-credentials/client_keys/client-{node_name}.pem` for chef client key

* To populate chef node, 

      knife cluster sync sandbox --no-cloud --sync-all

### Building boxes

* follow instructions in `ironfan_ci/README.md`

### Building vagrants with knife

[Script Integration](http://vagrantup.com/docs/rake.html):

    require 'vagrant'

    # Example of emulating vagrant up with some code around it
    task :up do
      puts "About to run vagrant-up..."
      env = Vagrant::Environment.new(:cwd => "/path/to/my/project")
      env.cli("up")
      puts "Finished running vagrant-up"
    end

    task :graceful_down do
      env = Vagrant::Environment.new(:cwd => "/path/to/my/project")
      env.vms.each do |vm|
        vm.channel.sudo("halt")
      end
    end

These are the parts of the vagrant automation:

* convert cluster definition to Vagrantfile
* knife provisions vagrant servers
* a set of conventions for using Vagrant with chef in a local debugging or testing environment.


on desktop:

* ssh key for machine

on desktop and chef server:

* server.rb
* validation.pem
* validator.pem
* cookbooks
* roles

on desktop and chef client:

* chef-dna.json
* client.pem
* validator.pem
* client.rb
* data bag keys

Here's what you need:

* jenkins server, properly installed and configured
* worker machines:
  - jenkins worker
  - discoverable by jenkins
  - virtualbox, vagrant etc
* a testing chef server

* vagrants that are clients of the testing chef server

### Decisions

you can either go

    A: [jenkins] -> on worker -> vagrant up, vagrant ssh [chef-client runner], vagrant rollback

    B: [jenkins] -> vagrant up (becomes a jenkins ssh worker) -> jenkins ssh [chef-client runner]

I went with A, because it lends itself to a distributed setup; doesn't have the
potential confounding effects of the jenkins ssh-ness; and is easy for me to
simulate and debug

## FIXME

* there are OSX things in odd places within jenkins 
* there are lots of roles running about inside chimpstation

## Troubleshooting

* make sure you have remote login on for all users -- visit the 'Sharing' System Prefences to correct this:

      sshd: fatal: Access denied for user _jenkins by PAM account configuration
