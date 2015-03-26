require_relative 'app/table'
require_relative 'app/robot'
square_table=Table.new(5,5)
robo=Robot.new(square_table.rows,square_table.columns,['NORTH','EAST','WEST','SOUTH'])
puts "TABLE SIZE: #{square_table.rows}X#{square_table.columns}"
puts "ALLOWED FACES: #{robo.valid_faces}"
puts "START PLAYING"
user_input=''
puts "Allowed commands MOVE,LEFT,RIGHT,REPORT,EXIT,PLACE X,Y,F\n"
while !user_input.eql? 'EXIT'
  puts "\ncommand>"
  user_input=gets
  case user_input.strip.upcase
  when 'MOVE'
   robo.move
 when 'LEFT'
   robo.left
 when 'RIGHT'
   robo.right
 when 'REPORT'
   puts "calling robo report"
   robo.report
 when 'EXIT'
    break  
 else
  if user_input.strip.upcase =~ /PLACE\s\d,\d,\w*/
    puts "user input: #{user_input}"
    inputs=user_input.strip.upcase.scan(/PLACE\s(.*?),(.*?),(.*)/).first
    puts "place command: #{inputs.inspect}"
    robo.place(inputs[0].to_i,inputs[1].to_i,inputs[2])
  else
    puts "Unknown Command!Use one of the commands MOVE,LEFT,RIGHT,REPORT,PLACE or EXIT"
  end
end
end
