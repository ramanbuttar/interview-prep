require_relative '../../max_slice'
require 'test/unit'

class TestMaxSlice < Test::Unit::TestCase

  def setup
    @obj = MaxSlice.new
  end

  def test_run
    assert_equal(@obj.run([1, 2, 3, 4, 5]), [[1, 2, 3, 4, 5], 15])
    assert_equal(@obj.run([-1, 2, 3, 4, 5]), [[2, 3, 4, 5], 14])
    assert_equal(@obj.run([1, -2, 3, 4, 5]), [[3, 4, 5], 12])
    assert_equal(@obj.run([1, 2, -3, 4, 5]), [[4, 5], 9])
    assert_equal(@obj.run([1, 2, 3, -4, 5]), [[1, 2, 3, -4, 5], 7])
    assert_equal(@obj.run([1, 2, 3, 4, -5]), [[1, 2, 3, 4], 10])
    assert_equal(@obj.run([1, 2, 3, -4, -5]), [[1, 2, 3], 6])
    assert_equal(@obj.run([-1, -2, -3, -4, -5]), [[-1], -1])
  end
end