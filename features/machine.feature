
Feature: Machine is awesome

  Scenario: Pleasant DNS Address

    # https://github.com/auxesis/cucumber-nagios/blob/master/lib/cucumber/nagios/steps/dns_steps.rb

    Given My zone is ".."
     When I lookup NODE-NAME-X-internal.myzone.com
     Then the name should resolve to my local IP address
      And the IP should be in the 10. block

    Given My zone is ".."
     When I lookup NODE-NAME-X.myzone.com
     Then the name should resolve to my public IP address
      And the IP should not be in the 10. block

  
  Scenario: 




