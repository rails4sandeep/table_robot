Given /^I have a table of size\s(.*?)by\s(.*?)$/ do |x,y|

  @square_table=TableRobot.create_table(x.to_i,y.to_i)
end

And /^a robot that can move on it$/ do
  @robo=TableRobot.create_robot(@square_table.rows,@square_table.columns,['NORTH','EAST','WEST','SOUTH'])
end

When /^I send a place command with entries (.*?),(.*?) and facing (.*?)$/ do |x,y,face|
  $stdout=StringIO.new #if command.eql? 'report'
  puts "#{$stdout.inspect}"
  $stdout.string
  @robo.place(x.to_i,y.to_i,face.chomp)
end

When /^I send a place command with entries (.*?)$/ do |place_command|
  $stdout=StringIO.new #if command.eql? 'report'
  puts "#{$stdout.inspect}"
  $stdout.string
  @robo.process_user_input(place_command)
end

Then /^the robot should ignore the commands$/ do
  @robo.on_table.should_not==true
end

When /^I send a (.*?) before sending the place command$/ do |command|
  @robo.process_user_input(command)
end

When /^I send the (.*?) command$/ do |command|
  @x_before=@robo.x
  @y_before=@robo.y
  @face_before=@robo.face
  @robo.process_user_input(command)
end

Then /^the robot should ignore the command$/ do
  @x_before.should==@robo.x
  @y_before.should==@robo.y
  @face_before.should==@robo.face
end

Then /^the facing of the robot should change to (.*?)$/ do |changed_facing|
  @robo.face.should==changed_facing
end

Then /^the position of the robot should change to (.*?), (.*?) and (.*?)$/ do |new_x,new_y,new_face|
  @robo.x.should==new_x.to_i
  @robo.y.should==new_y.to_i
  @robo.face.should==new_face
end

Then /^the position of robot should be printed on screen$/ do
  STDOUT.puts $stdout.string
  ($stdout.string.include? @robo.x.to_s).should==true
  ($stdout.string.include? @robo.y.to_s).should==true
  ($stdout.string.include? @robo.face.to_s).should==true
end