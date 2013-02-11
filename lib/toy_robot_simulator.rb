require 'position'

class ToyRobotSimulator
  attr_reader :robot_position

  def initialize(position = Position.new(0, 0, :right))
    place(position)
  end

  def place(position)
    return false unless position_on_board?(position)
    @robot_position = position
  end

  def move(direction = @robot_position.direction)
    return false unless move_allowed?(direction)
    @robot_position = @robot_position.plus(direction)
  end

  def rotate_left
    @robot_position.rotate_left!
  end

  def rotate_right
    @robot_position.rotate_right!
  end

  def position_on_board?(position)
    (0..4).include?(position.x) && (0..4).include?(position.y)
  end

  def move_allowed?(direction)
    position_on_board?(@robot_position.plus(direction))
  end
end
