# Ironfan-CI: Continuous Testing for your Architecture

The ironfan project is an expressive toolset for constructing scalable, resilient architectures. It works in the cloud, in the data center, and on your laptop, and makes your system diagram visible and inevitable.

This repo implements continuous testing for your architecture:

* cookbooks to set up a local chef server and jenkins master
* vagrant definitions for the operating systems ironfan supports
* test framework that combines cucumber to verify the [silverware](https://github.com/infochimps-labs/ironfan-homebase/tree/master/cookbooks/silverware) announcement contract
* (soon) hooks to tie these CI tests to your monitoring system

To get started with ironfan, clone the [homebase repo](https://github.com/infochimps-labs/ironfan-homebase) and follow the [installation instructions](https://github.com/infochimps-labs/ironfan/wiki/install). Please file all issues on [ironfan issues](https://github.com/infochimps-labs/ironfan/issues).

## Index

Ironfan-CI works together with the full ironfan toolset:

* [ironfan-homebase](https://github.com/infochimps-labs/ironfan-homebase): centralizes the cookbooks, roles and clusters. A solid foundation for any chef user.
* [ironfan gem](https://github.com/infochimps-labs/ironfan): core ironfan models, and knife plugins to orchestrate machines and coordinate truth among you homebase, cloud and chef server.
* [ironfan-pantry](https://github.com/infochimps-labs/ironfan-pantry): Our collection of industrial-strength, cloud-ready recipes for Hadoop, HBase, Cassandra, Elasticsearch, Zabbix and more.
* [silverware cookbook](https://github.com/infochimps-labs/ironfan-homebase/tree/master/cookbooks/silverware): coordinate discovery of services ("list all the machines for `awesome_webapp`, that I might load balance them") and aspects ("list all components that write logs, that I might logrotate them, or that I might monitor the free space on their volumes".
* [ironfan-ci](https://github.com/infochimps-labs/ironfan-ci): Continuous integration testing of not just your cookbooks but your *architecture*.

* [ironfan wiki](https://github.com/infochimps-labs/ironfan/wiki): high-level documentation and install instructions
* [ironfan issues](https://github.com/infochimps-labs/ironfan/issues): bugs, questions and feature requests for *any* part of the ironfan toolset.
* [ironfan gem docs](http://rdoc.info/gems/ironfan): rdoc docs for ironfan

__________________________________________________________________________


**in progress**: some of the below is speculative (@sya)

__________________________________________________________________________

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
