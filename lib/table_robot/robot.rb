class Robot
  attr_accessor :x,:y,:face,:valid_rows,:valid_columns,:valid_faces,:on_table
  def initialize(rows,columns,faces)
    @valid_rows=rows
    @valid_columns=columns
    @valid_faces=faces
    @on_table=false
  end

  def place(x,y,face)
    puts "Valid Rows: #{@valid_rows} Valid Columns: #{@valid_columns}"
        @x=x
        @y=y
        @face=face
        @on_table=true if !@on_table
  end

  def move
    if @on_table
      case @face
      when 'NORTH'
        if @y==@valid_columns
          puts "FATAL!Command Ignored"
        else
          @y=@y+1
        end
      when 'SOUTH'
        if @y==1
          puts "FATAL!Command Ignored"
        else
          @y=@y-1
        end
      when 'EAST'
        if @x==@valid_rows
          puts "FATAL!Command Ignored"
        else
          @x=@x+1
        end
      when 'WEST'
        if @x==1
          puts "FATAL!Command Ignored"
        else
          @x=@x-1
        end
      end
    else
      puts "Command Ignored!Robot not on table"
    end
  end
  
  def left
    if @on_table
      case @face
      when 'NORTH'
        @face='WEST'
      when 'SOUTH'
        @face='EAST'
      when 'WEST'
        @face='SOUTH'
      when 'EAST'
        @face='NORTH'
      end
    else
      puts "Command Ignored!Robot not on table"
    end
  end
  
  def right
    if @on_table
      case @face
      when 'NORTH'
        @face='EAST'
      when 'SOUTH'
        @face='WEST'
      when 'WEST'
        @face='NORTH'
      when 'EAST'
        @face='SOUTH'
      end
    else
      puts "Command Ignored!Robot not on table"
    end
  end
  
  def report
    if @on_table
      puts "X: #{@x},Y: #{@y},FACE: #{@face}"
    else
      puts "Command Ignored!Robot not on table"
    end
  end

  def process_place_command(user_input)
    inputs=user_input.scan(/PLACE\s(.*?),(.*?),(.*)/).first
    if inputs[0].to_i.class==Fixnum && inputs[1].to_i.class==Fixnum && inputs[2].class==String
      if inputs[0].to_i<=0 || inputs[0].to_i >@valid_rows
        invalid_flag=true
      elsif inputs[1].to_i<=0 || inputs[1].to_i>@valid_columns
        invalid_flag=true
      elsif !@valid_faces.include? inputs[2]
        invalid_flag=true
      end
      if invalid_flag
        puts "FATAL!Command Ignored"
      else
        place(inputs[0].to_i,inputs[1].to_i,inputs[2])
      end
    else
      puts "Invalid Input!Command Ignored"
    end
  end

  def process_user_input(user_input)
      case user_input.strip.upcase
      when 'MOVE'
       move
    when 'LEFT'
       left
    when 'RIGHT'
       right
    when 'REPORT'
       report
    else
      if user_input =~ /PLACE\s\d,\d,\w*/
        process_place_command(user_input)
      else
        puts "Unknown Command!Use one of the commands MOVE,LEFT,RIGHT,REPORT,PLACE or EXIT"
      end
  end
  end

  def accept_commandline_inputs
    user_input=''
    while !user_input.eql? 'EXIT'
        puts "\ncommand>"
        user_input=gets
        case user_input.strip.upcase
          when 'EXIT'
            break
          else
            process_user_input(user_input.strip.upcase)
          end
    end
  end

end