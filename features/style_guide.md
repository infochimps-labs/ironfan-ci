
* Running
* Performant
* Works correctly
* Secure
* Configuration details correct
* 



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
  - exists, with the right owner & permissions
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

* users -- should be only the
  - base system users
  - users announced by components
  - organizations's users (tagged by machine)
  
* OS metrics
  - do not use ohai
  - do not go nuts with this. This complements and extends monitoring software; collectd exists

* Chef preconditions
  - eg 
  - helper to probe ohai
  
  

__________________________________________________________________________


* http://cuke4ninja.com/sec_basic_feature_file.html

### Actions


Never write code in steps


One action ('When' step) per feature.
> f you want to put more than one When step, then you have a complex multi-step action that means something to the business. That flow should be captured by your domain model. Talk to the business users, decide on the name for that flow and specify it using a single step, which invokes the appropriate domain model procedure. Don't use feature files for scripting the flow.

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
