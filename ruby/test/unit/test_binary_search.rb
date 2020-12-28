require_relative '../../binary_search'
require 'test/unit'

class TestBinarySearch < Test::Unit::TestCase
  
  def setup
    @obj = BinarySearch.new
  end

  def test_one
    list = [1, 2, 3, 4, 5, 6]
    assert_nil(@obj.run(list, 0))
    assert_equal(@obj.run(list, 1), 0)
    assert_equal(@obj.run(list, 2), 1)
    assert_equal(@obj.run(list, 3), 2)
    assert_equal(@obj.run(list, 4), 3)
    assert_equal(@obj.run(list, 5), 4)
    assert_equal(@obj.run(list, 6), 5)
    assert_nil(@obj.run(list, 7))
  end

  def test_two
    list = [11, 12, 13, 14, 15, 16, 17]
    assert_nil(@obj.run(list, 10))
    assert_equal(@obj.run(list, 11), 0)
    assert_equal(@obj.run(list, 12), 1)
    assert_equal(@obj.run(list, 13), 2)
    assert_equal(@obj.run(list, 14), 3)
    assert_equal(@obj.run(list, 15), 4)
    assert_equal(@obj.run(list, 16), 5)
    assert_equal(@obj.run(list, 17), 6)
    assert_nil(@obj.run(list, 18))
  end
end