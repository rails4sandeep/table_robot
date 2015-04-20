require_relative 'table_robot/table'
require_relative 'table_robot/robot'

module TableRobot

  def TableRobot.create_table(rows,columns)
    @table=Table.new(rows,columns)
  end

  def TableRobot.create_robot(rows,columns,faces)
    @robo=Robot.new(rows,columns,faces)
  end


end
