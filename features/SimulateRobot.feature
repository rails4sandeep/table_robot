Feature:
  As a user of the table robot
  I want to be able to issue commands
  So that I can see it moving across the table

Scenario Outline: Invalid place commands are ignored
  Given I have a table of size 5 by 5
  And a robot that can move on it
  When I send a place command with entries <x>,<y> and facing <face>
  Then the robot should ignore the commands

  Examples:
  |x|y|face|
  |0|1|WEST|
  |1|0|EAST|
  |-1|2|SOUTH|
  |3 |-1|NORTH|
  |6 |5 |SOUTH|
  |4 |6 |EAST |
  |1 |1 |SOUTH WEST|

Scenario Outline: Ignore all commands before initial place command
  Given I have a table of size 5 by 5
  And a robot that can move on it
  When I send a <command> before sending the place command
  Then the robot should ignore the commands

  Examples:
  |command|
  |move   |
  |left   |
  |right  |
  |report |

Scenario Outline: Robot should ignore commands that will make it fall off the table
  Given I have a table of size 5 by 5
  And a robot that can move on it
  And I send a place command with entries <x>,<y> and facing <face>
  When I send the move command
  Then the robot should ignore the command
  Examples:
  |x|y|face|
  |1|5|NORTH|
  |5|1|SOUTH|
  |5|1|EAST |
  |1|5|WEST |

Scenario Outline: Robot should move 90 degrees to the left when LEFT command is sent
  Given I have a table of size 5 by 5
  And a robot that can move on it
  And I send a place command with entries <x>,<y> and facing <face>
  When I send the left command
  Then the facing of the robot should change to <changed_facing>
  Examples:
  |x|y|face|changed_facing|
  |1|1|NORTH|WEST         |
  |1|1|SOUTH|EAST         |
  |1|1|WEST |SOUTH        |
  |1|1|EAST |NORTH        |

  Scenario Outline: Robot should move 90 degrees to the right when RIGHT command is sent
    Given I have a table of size 5 by 5
    And a robot that can move on it
    And I send a place command with entries <x>,<y> and facing <face>
    When I send the right command
    Then the facing of the robot should change to <changed_facing>
  Examples:
    |x|y|face|changed_facing|
    |1|1|NORTH|EAST         |
    |1|1|SOUTH|WEST         |
    |1|1|WEST |NORTH        |
    |1|1|EAST |SOUTH        |

 Scenario Outline: Robot should move one step in the direction of its facing when MOVE command is sent
   Given I have a table of size 5 by 5
   And a robot that can move on it
   And I send a place command with entries <x>,<y> and facing <face>
   When I send the move command
   Then the position of the robot should change to <new_x>, <new_y> and <new_face>
   Examples:
   |x|y|face|new_x|new_y|new_face|
   |1|1|NORTH|1   |2    |NORTH   |
   |1|2|SOUTH|1   |1    |SOUTH   |
   |2|2|WEST |1   |2    |WEST    |
   |2|2|EAST |3   |2    |EAST    |

 Scenario: sending report command to Robot should print the position of the robot
   Given I have a table of size 5 by 5
   And a robot that can move on it
   And I send a place command with entries 2,2 and facing NORTH
   When I send the report command
   Then the position of robot should be printed on screen