
* Running
* Performant
* Works correctly
* Secure
* Configuration details correct
* 

* If you can think of a way another cookbook might want to declare the same thing, it probably goes in the announcement.
* If you can't describe the value to a user of what you're testing, it's probably an implementation detail. ("the file /foo/bar should exist" vs "the site's images directory should be populated").
* You're verifying the machine is correct, not how it got there. Whether chef, a foolish-but-diligent intern, or magic space ponies set it up thusly, that's good enough for you.
* for example, do not check if things are symlinks vs files, etc -- just that they're in the right place with the right contents
* Do a minimum of OS metrics. You care that the components work correctly and are stable, not how many IOPS the disks are cranking out. If a sanity check of the disk's IOPS help you verify the app will be stable, then do so. However, Ironfan-CI complements and extends monitoring software -- collectd &c exist and are really good at what they do.


* *components*:     Traditional feature and unit tests verify acceptance spefications for components.
* *machine*:        Ironfan-CI verifies the acceptance specifications for your deployed machines.
* *infrastructure*: Monitoring and Metrics are the acceptance specifications for your architecture.


__________________________________________________________________________

## Components

* daemons:
  - running
  - not flapping
  - 
* ports:
  - open on declared interfaces
  - not open on others
  - performance (first connect / total response times) is good
  - status probe returns happiness
  
* dashboard
  - is on
  - right pages exist
* log
  - exists, with the right owner & permissions
  - has some lines
  - not too many
  - is opened by the daemon
* directory
  - exists, with the right owner & permissions
  - on right volume(s)
* exported file / jar / conf / lib
  - exists, with the right owner & permissions.
  - ?version?
* configuration:
  - need a standardized format for config values
  - if at *all* possible, request it from the running app and NOT from parsing the config file.
  - slash notation for selecting
* scheduled action
* authorization key

* program
  - correct version/sha
  - stimulus/response
  - symlinked correctly
  - is first in the path
  - is right `alternatives` selection 
* deploy
  - submodules exist
  - right branch, right sha
  - feature flags (?


__________________________________________________________________________

### machine

These are declared separately -- aspects of the machine should be decoupled from aspects of the components it runs

* dns resolves

* list of users and groups -- should be only the
  - base system users
  - users announced by components
  - organizations's users (tagged by machine)
  - you can use ohai for this

* list of running processes 
  - base system processes
  - daemons announced by components
  - processes whitelisted as unimportant
  
* list of open ports
  - base system ports, by interface
  - ports announced by components
  - ports owned by user ids that are whitelisted as using unpredictable/dynamically allocated ports
  
* OS metrics
  - do not use ohai
  - do not go nuts with this. This complements and extends monitoring software; collectd exists

* Chef preconditions
  - helper to probe ohai
  - good: the machine has a `[:cloud]` attribute. bad: the machine has an `[:ec2]` attribute
  
* volumes  
  - exist, with right owner and permissions, filesystem format
  - right size (free / %free / total)
  - balanced usage (eg a datanode isn't piling all its data on /mnt1 ignoring /mnt2)
  - that it meets the declaration by the provisioner
  - only these exist:
    - system volumes
    - volumes declared by provisioner
  
### meta

* run time
* idempotent convergence
* warnings
* can pickle a chef output template -- 95% of it should be invariant after second run.
  
__________________________________________________________________________


* http://cuke4ninja.com/sec_basic_feature_file.html

### Actions


Never write code in steps


One action ('When' step) per feature.
> f you want to put more than one When step, then you have a complex multi-step action that means something to the business. That flow should be captured by your domain model. Talk to the business users, decide on the name for that flow and specify it using a single step, which invokes the appropriate domain model procedure. Don't use feature files for scripting the flow.

As a rule of thumb, anything that is literally specified should be in double quotes, otherwise it should be specified within the sentence. Imperative: I set the field labeled "First Name" to "John" / Declarative: I enter the details for user John


### Scenario

> A good technique for deciding on a title is to think about what you would type into Google to search for this file if it were online. http://cuke4ninja.com/sec_file_interpret.html


so instead:

    Scenario Outline: third-level ninjas engage samurai
      Given the ninja has a <belt level> level black-belt 
      When attacked by <opponent>
      Then the ninja should <expected action>

      Examples:
      |belt level |opponent     |expected action	 |
      |third      |a samurai    |engage the opponent |
      |third      |Chuck Norris |run for his life	 |

**Attribute sets**:

    Scenario: Fully armed 
      Given a ninja with the following experience
        | belt_level  | katana | sake     | fought  | magic |
        | third       | two    | three    | samurai | five  |
      When attacked by a samurai
      Then the ninja should engage the opponent


**background**: Applies to all features below. Avoid complex backgrounds -- "it is often a sign that you are describing how the context needs to be set up rather than what the context is". Try a [technical hook](http://cuke4ninja.com/sec_hooks.html) instead.

    Feature: Skill availability
      As a ninja trainer, 
      I want ninjas to understand the dangers of various opponents 
      so that they can engage them in combat more effectively 

      Background: Allowed skills
        Given the following skills are allowed
        | katana          |
        | karate-kick     |
        | roundhouse-kick |
