require_relative '../../shortest_path'
require 'test/unit'

class TestShortestPath < Test::Unit::TestCase

  def setup
    map = Map.new(3)
    map.map[0] = [true, true, true]
    map.map[1] = [false, false, true]
    map.map[2] = [true, true, true]

    @obj = ShortestPath.new(map)
  end

  def test_find
    path = @obj.find([0,0], [2, 0])
    assert_equal(path, [[0, 0], [0, 1], [0, 2], [1, 2], [2, 2], [2, 1], [2, 0]])
    assert_equal(path.count, 7)
  end
end