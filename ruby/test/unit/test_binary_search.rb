require_relative '../../binary_search'
require 'test/unit'

class TestBinarySearch < Test::Unit::TestCase
  
  def setup
    @obj = BinarySearch.new
  end

  def test_one
    array = [1, 2, 3, 4, 5, 6]
    assert_nil(@obj.run(array, 0))
    assert_equal(@obj.run(array, 1), 0)
    assert_equal(@obj.run(array, 2), 1)
    assert_equal(@obj.run(array, 3), 2)
    assert_equal(@obj.run(array, 4), 3)
    assert_equal(@obj.run(array, 5), 4)
    assert_equal(@obj.run(array, 6), 5)
    assert_nil(@obj.run(array, 7))
  end

  def test_two
    array = [11, 12, 13, 14, 15, 16, 17]
    assert_nil(@obj.run(array, 10))
    assert_equal(@obj.run(array, 11), 0)
    assert_equal(@obj.run(array, 12), 1)
    assert_equal(@obj.run(array, 13), 2)
    assert_equal(@obj.run(array, 14), 3)
    assert_equal(@obj.run(array, 15), 4)
    assert_equal(@obj.run(array, 16), 5)
    assert_equal(@obj.run(array, 17), 6)
    assert_nil(@obj.run(array, 18))
  end
end