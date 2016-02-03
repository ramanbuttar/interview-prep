require_relative '../../two_sorted_arrays'
require 'test/unit'

class TestTwoSortedArrays < Test::Unit::TestCase

  def setup
    @obj = TwoSortedArrays.new
  end
  
  def test_both_empty_arrays
    assert_nil(@obj.run([], [], 2))
  end

  def test_same_size_arrays
    assert_equal(@obj.run([12, 14, 16, 18, 20], [11, 13, 15, 17, 19], 0), 11)
    assert_equal(@obj.run([12, 14, 16, 18, 20], [11, 13, 15, 17, 19], 1), 12)
    assert_equal(@obj.run([12, 14, 16, 18, 20], [11, 13, 15, 17, 19], 2), 13)
    assert_equal(@obj.run([12, 14, 16, 18, 20], [11, 13, 15, 17, 19], 3), 14)
    assert_equal(@obj.run([12, 14, 16, 18, 20], [11, 13, 15, 17, 19], 4), 15)
    assert_equal(@obj.run([12, 14, 16, 18, 20], [11, 13, 15, 17, 19], 5), 16)
    assert_equal(@obj.run([12, 14, 16, 18, 20], [11, 13, 15, 17, 19], 6), 17)
    assert_equal(@obj.run([12, 14, 16, 18, 20], [11, 13, 15, 17, 19], 7), 18)
    assert_equal(@obj.run([12, 14, 16, 18, 20], [11, 13, 15, 17, 19], 8), 19)
    assert_equal(@obj.run([12, 14, 16, 18, 20], [11, 13, 15, 17, 19], 9), 20)
    assert_nil(@obj.run([12, 14, 16, 18, 20], [11, 13, 15, 17, 19], 10))
    assert_nil(@obj.run([12, 14, 16, 18, 20], [11, 13, 15, 17, 19], 11))
  end

  def test_first_empty_array
    assert_equal(@obj.run([], [3, 5, 10, 15, 27], 0), 3)
    assert_equal(@obj.run([], [3, 5, 10, 15, 27], 1), 5)
    assert_equal(@obj.run([], [3, 5, 10, 15, 27], 2), 10)
    assert_equal(@obj.run([], [3, 5, 10, 15, 27], 3), 15)
    assert_equal(@obj.run([], [3, 5, 10, 15, 27], 4), 27)
    assert_nil(@obj.run([], [3, 5, 10, 15, 27], 5))
    assert_nil(@obj.run([], [3, 5, 10, 15, 27], 6))
  end

  def test_second_empty_array
    assert_equal(@obj.run([3, 5, 10, 15, 27], [], 0), 3)
    assert_equal(@obj.run([3, 5, 10, 15, 27], [], 1), 5)
    assert_equal(@obj.run([3, 5, 10, 15, 27], [], 2), 10)
    assert_equal(@obj.run([3, 5, 10, 15, 27], [], 3), 15)
    assert_equal(@obj.run([3, 5, 10, 15, 27], [], 4), 27)
    assert_nil(@obj.run([3, 5, 10, 15, 27], [], 5))
    assert_nil(@obj.run([3, 5, 10, 15, 27], [], 6))
  end

  def test_different_size_arrays
    assert_equal(@obj.run([2, 4, 8, 12], [3, 5, 10, 15, 27], 0), 2)
    assert_equal(@obj.run([2, 4, 8, 12], [3, 5, 10, 15, 27], 1), 3)
    assert_equal(@obj.run([2, 4, 8, 12], [3, 5, 10, 15, 27], 2), 4)
    assert_equal(@obj.run([2, 4, 8, 12], [3, 5, 10, 15, 27], 3), 5)
    assert_equal(@obj.run([2, 4, 8, 12], [3, 5, 10, 15, 27], 4), 8)
    assert_equal(@obj.run([2, 4, 8, 12], [3, 5, 10, 15, 27], 5), 10)
    assert_equal(@obj.run([2, 4, 8, 12], [3, 5, 10, 15, 27], 6), 12)
    assert_equal(@obj.run([2, 4, 8, 12], [3, 5, 10, 15, 27], 7), 15)
    assert_equal(@obj.run([2, 4, 8, 12], [3, 5, 10, 15, 27], 8), 27)
    assert_nil(@obj.run([2, 4, 8, 12], [3, 5, 10, 15, 27], 9))
    assert_nil(@obj.run([2, 4, 8, 12], [3, 5, 10, 15, 27], 10))
  end
end