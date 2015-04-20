require_relative 'table'
require_relative 'robot'

module TableRobot

  def TableRobot.create_table(rows,columns)
    @table=Table.new(rows,columns)
  end

  def TableRobot.create_robot(rows,columns,faces)
    @robo=Robot.new(rows,columns,faces)
  end


end
