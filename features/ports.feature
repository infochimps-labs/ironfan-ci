
# TODO: work on this:
#     http://lizkeogh.com/2008/09/10/feature-injection-and-handling-technical-stories/


Feature: Ports


  In order to connect to COMPONENT
  As a consumer of COMPONENT
  will need its ports to be open, performant, and delivering sensible results

  As a user of the platform
  I want machines' ports to only bind to defined interfaces, to be parsimonious with access, and to be robust against interference
  So that my system is secure and reliable

  As a user of the platform
  I want COMPONENT to be performant
  So that the apps I build are fun and profitable, and to control costs.

  In order to detect flaws early
  I want to know if the performance of COMPONENT changes dramatically
  So that I can celebrate, mourn or get to work

  In order to confidently use COMPONENT
  As a consumer / As ==specific consumer==
  I want to verify its application-specific integrity

  # TODO: name interfaces: public, private, host, etc -- (provisioner responsibility)

  # http://nc110.sourceforge.net/
  # http://en.wikipedia.org/wiki/Netcat#Examples
  # port scan: nc -v -w2 -z scanme.org 20-40
  # To obtain a hex dump file of the data sent either way, use "-o logfile".  The dump lines begin with "<" or ">" to respectively indicate "from the net" or "to the net", and contain the total count per direction, and hex and ascii representations of the traffic.
  # UDP connections are opened instead of TCP when -u is specified
  # -w sets timeout
  # netstat -ant

  Scenario: Ports are open on the right interfaces, and not open on the wrong ones
    Given a port
      And a list of the interfaces on the machine
     Then the port is open on {explicit | all}
      And the port is closed on {the remainder}

  Scenario: Component is performant, and performance is stable
    Given a port
     When I poke the port
     Then its time of first connect should be X +/- x
      And its time of total response should be Y +/- y

  Scenario: Component shows evidence of correct behavior
     When I {handle for command stored elsewhere}
     Then I should get {

     When I request its status
     Then I should get confirmation the app is working
      And the app should be in production mode # lookup table knows what to grep for
     
    Given a connection to the DB
     When I store a string in the database
      And I request that record 
     Then I should get a successful response
      And I should get the value I stored
      And it should take less than X +/- x seconds

  # https://github.com/auxesis/cucumber-nagios/blob/master/lib/cucumber/nagios/steps/http_steps.rb

  Scenario: Port is a performant HTTP port
    Given a component with http port 6789
     When I request "/status"
     Then I should see "I AM ALIVE"
      And the request should succeed
