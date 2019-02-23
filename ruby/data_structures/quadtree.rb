class Node
  def initialize(top, bottom, left, right)
    @top, @bottom, @left, @right = top, bottom, left, right
    @children = {NW: nil,
                 NE: nil,
                 SE: nil,
                 SW: nil}
    @coordinate = nil
  end

  def insert_coordinate(coordinate)
    if coordinate.x < @left || coordinate.x > @right || coordinate.y < @bottom || coordinate.y > @top
      raise OutOfBoundingBoxError.new("Coordinate: (#{coordinate.x}, #{coordinate.y})")
    end

    if @coordinate.nil?
      # simple point insertion
      @coordinate = coordinate
    else
      quadrant = determine_quadrant(coordinate)
      if @children[quadrant].nil?
        # create quadrant
        top, bottom, left, right = quadrant_boundary(quadrant)
        @children[quadrant] = Node.new(top, bottom, left, right)
      end
      @children[quadrant].insert_coordinate(coordinate)
    end
  end

  def print
    puts '*' * 20
    puts "NW: (#{@left}, #{@top})"
    puts "NE: (#{@right}, #{@top})"
    puts "SE: (#{@right}, #{@bottom})"
    puts "SW: (#{@left}, #{@bottom})"
    puts "Center: (#{center.x}, #{center.y})"
    puts "Width: #{width}"
    puts "Height: #{height}"
    puts "Coordinate: (#{@coordinate.x}, #{@coordinate.y})" if @coordinate
    puts "Children: "
    @children.each_pair do |quadrant, child|
      next unless child
      puts quadrant
      child.print
    end
  end

  private

  def width
    @right - @left
  end

  def height
    @top - @bottom
  end

  def center
    x = width / 2.0
    y = height / 2.0
    Tuple.new(x, y)
  end

  def determine_quadrant(coordinate)
    x = coordinate.x < center.x ? :west : :east
    y = coordinate.y < center.y ? :south : :north

    if x == :west
      y == :north ? :NW : :SW
    elsif x == :east
      y == :north ? :NE : :SE
    end
  end

  def quadrant_boundary(quadrant)
    # top, bottom, left, right

    case quadrant
      when :NW
        [@top, center.y, @left, center.x]
      when :NE
        [@top, center.y, center.x, @right]
      when :SE
        [center.y, @bottom, center.x, @right]
      when :SW
        [center.y, @bottom, @left, center.x]
    end
  end
end

class OutOfBoundingBoxError < StandardError; end

class Tuple
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end

node = Node.new(20, 0, 0, 100)
coordinate = Tuple.new(25, 5)
node.insert_coordinate(coordinate)
node.insert_coordinate(coordinate)
node.insert_coordinate(coordinate)
node.insert_coordinate(coordinate)
node.insert_coordinate(coordinate)
node.print