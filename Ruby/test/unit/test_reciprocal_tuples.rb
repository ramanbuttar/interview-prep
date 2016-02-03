require_relative '../../reciprocal_tuples'
require 'test/unit'

class TestReciprocalTuples < Test::Unit::TestCase

  def setup
    @obj = ReciprocalTuples.new
  end
  
  def test_run
    assert_equal(@obj.run([]), 0)
    assert_equal(@obj.run([[1, 2]]), 0)
    assert_equal(@obj.run([[1, 2], [2, 3]]), 0)
    assert_equal(@obj.run([[1, 2], [2, 1]]), 1)
    assert_equal(@obj.run([[1, 2], [2, 1], [1, 2]]), 1)
    assert_equal(@obj.run([[1, 2], [2, 1], [1, 2], [2, 1]]), 1)
    assert_equal(@obj.run([[1, 2], [2, 1], [2, 3], [1, 2]]), 1)
    assert_equal(@obj.run([[1, 2], [2, 1], [2, 3], [1, 2], [3, 2]]), 2)
    assert_equal(@obj.run([[1, 2], [2, 1], [2, 3], [1, 2], [3, 1]]), 1)
  end
end