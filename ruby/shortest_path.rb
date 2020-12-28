class Map
  PATH = '_'
  WALL = 'x'

  attr_accessor :map

  def initialize(size=3)
    @map = Array.new(size)
  end

  def neighbouring_paths(coordinates)
    row = coordinates.first
    col = coordinates.last
    up = validate(row, col - 1)
    down = validate(row, col + 1)
    left = validate(row - 1, col)
    right = validate(row + 1, col)
    [up, down, left, right].compact
  end

  def print
    @map.each do |row|
      display = ''
      row.each do |col|
        display += (col ? PATH : WALL)
        display += ' '
      end
      puts display
    end
  end

  private

  def validate(row, col)
    return if row < 0
    return if row >= @map.size
    return if col < 0
    return if col >= @map[row].size
    return if @map[row][col] == false
    [row, col]
  end
end

class ShortestPath
  def initialize(map)
    @map = map
  end

  def find(start, finish)
    visited = [start]
    queue = @map.neighbouring_paths(start)
    path = [start]

    while queue.any?
      location = queue.shift

      if location == finish
        path << finish
        return path
      end

      unless visited.include?(location)
        visited << location
        path << location
        queue += @map.neighbouring_paths(location)
        queue.uniq!
      end
    end
  end
end