require 'toy_robot_simulator'
require 'position'

class ToyRobotInterface
  attr_reader :simulator, :started

  def initialize
    @simulator = ToyRobotSimulator.new
  end

  def read_commands
    puts "Leave blank line and press enter to escape"
    while (line = $stdin.gets.chomp)
      exit if line == ''
      process(line)
    end
  end

  def read_file(file)
    File.readlines(file).each do |line|
      process(line)
    end
  end

  def process(string_command)
    command, *args = string_command.split(' ')
    case command
    when 'PLACE'
      args = args.first.split(',')
      place(*args)
    when 'MOVE'   then move
    when 'LEFT'   then left
    when 'RIGHT'  then right
    when 'REPORT' then report
    end
  end

  def place(x, y, direction)
    direction = case direction
    when 'NORTH' then :up
    when 'SOUTH' then :down
    when 'EAST' then :right
    when 'WEST' then :left
    else raise ArgumentError, "direction must be NORTH, SOUTH, EAST or WEST"
    end
    @simulator.place(Position.new(x, y, direction)) &&
      (@started ||= true)
  end

  def move
    @started && @simulator.move
  end

  def left
    @started && @simulator.rotate_left
  end

  def right
    @started && @simulator.rotate_right
  end

  def report
    @started && puts(@simulator.robot_position)
  end
end

