class Position
  attr_accessor :x, :y, :direction

  def initialize(x, y, direction = nil)
    @x = x.to_i
    @y = y.to_i
    @direction = direction
  end

  def plus(direction)
    future_position = Position.new(@x, @y, @direction)
    case direction
    when :left  then future_position.x -= 1
    when :right then future_position.x += 1
    when :up    then future_position.y += 1
    when :down  then future_position.y -= 1
    end
    future_position
  end

  def rotate_left!
    @direction = case @direction
    when :up    then :left
    when :left  then :down
    when :down  then :right
    when :right then :up
    end
  end

  def rotate_right!
    @direction = case @direction
    when :up    then :right
    when :right then :down
    when :down  then :left
    when :left  then :up
    end
  end

  def ==(parts)
    x, y, direction = parts
    @x == x && @y == y && @direction == direction
  end

  def to_s
    "#{@x},#{@y},#{direction_name}"
  end

  def direction_name
    case @direction
    when :left  then 'WEST'
    when :right then 'EAST'
    when :up    then 'NORTH'
    when :down  then 'SOUTH'
    end
  end
end

