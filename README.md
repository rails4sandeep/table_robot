# Toy Robot coding challenge
This is my solution to the Toy Robot simulator coding challenge

##Description:

. The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.

. There are no other obstructions on the table surface.

. The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

. Create an application that can read in commands of the following form -

PLACE X,Y,F

MOVE

LEFT

RIGHT

REPORT

. PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. 

. The origin (0,0) can be considered to be the SOUTH WEST most corner.

. The first valid command to the robot is a PLACE command, aXer that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.

. MOVE will move the toy robot one unit forward in the direction it is currently facing.

. LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.

. REPORT will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.

. A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands.

. Input can be from a file, or from standard input, as the developer chooses.

. Provide test data to exercise the application.

##Constraints:

The toy robot must not fall off the table during movement. This also includes the ini8al placement of the toy robot. 

Any move that would cause the robot to fall must be ignored.

##Example Input and Output:

a)

PLACE 0,0,NORTH

MOVE

REPORT

Output: 0,1,NORTH

b)

PLACE 0,0,NORTH

LEFT

REPORT

Output: 0,0,WEST

c)

PLACE 1,2,EAST

MOVE

MOVE

LEFT

MOVE

REPORT

Output: 3,3,NORTH

#Installation
`gem install table_robot`

or include

`gem 'table_robot'`

in your Gemfile

#Usage
create the table

`@square_table=TableRobot.create_table(5,5)`

create the robot

`@robo=TableRobot.create_robot(@square_table.rows,@square_table.columns,['NORTH','EAST','WEST','SOUTH'])`

To play with the interactive commandline shell as outlined in the coding challenge

`@robo.accept_commandline_inputs`

##Commandline Interface

The commandline interface prompts the user to enter a command
`command>`
If the command is one of the commands defined in the coding challenge `PLACE,REPORT,MOVE,LEFT` and `RIGHT`, it processes them.

The commandline interface is case insensitive.

Until a valid `PLACE` command is entered all other commands are ignored.

A `REPORT` command returns the current position of the robot on the table

The `MOVE`,`LEFT` and `RIGHT` commands moves the robot on the table as defined in the coding challenge as long as the robot do not fall off the table processing them.

#Tests
To run all the tests

`rake tests`
