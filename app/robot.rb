class Robot
  attr_accessor :x,:y,:face,:valid_rows,:valid_columns,:valid_faces,:on_table

  def initialize(rows,columns,faces)
    @valid_rows=rows
    @valid_columns=columns
    @valid_faces=faces
    @on_table=false
    puts "object created.R:#{@valid_rows},C:#{@valid_columns},F:#{@valid_faces},T:#{@on_table}"
  end

  def place(x,y,face)
    puts "Valid Rows: #{@valid_rows} Valid Columns: #{@valid_columns}"
    invalid_flag=false
    if x.class==Fixnum && y.class==Fixnum && face.class==String
      if x<=0 || x >@valid_rows
        invalid_flag=true
      elsif y<=0 || y>@valid_columns
        invalid_flag=true
      elsif !@valid_faces.include? face
        invalid_flag=true
      end
      if invalid_flag
        puts "FATAL!Command Ignored"
      else
        @x=x
        @y=y
        @face=face
        @on_table=true if !@on_table
        puts "place command fired"
      end
    else
      puts "Invalid Input!Command Ignored"
    end
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

end