Feature: Installed programs

  # https://github.com/hedgehog/cuken/blob/master/features/command_examples/output.feature

  Scenario: It runs when called
    Given I have installed "pig"
     Then it is called when I run "pig"
      And the generic directory is a symlink to the versioned one
    

  Scenario: It works
    When I run `ruby -e 'puts :a.to_s * 65536'`
    Then the output should contain "a"
    # FIXME: "And it is successful"
    And the exit status should be 0


  Scenario: It imports concerns
    Given I have installed "pig", "hadoop" and "zookeeper"
     Then pig should import "hadoop*native" jars
      And pig should import "zookeeper" jars
      And pig should import "hbase" confs
