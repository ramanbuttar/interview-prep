require_relative '../../flatten'
require 'test/unit'

class TestFlatten < Test::Unit::TestCase

  def setup
    @obj = Flatten.new
  end

  def test_run
    assert_equal(@obj.run([1,2,3,[4,3],4,[5]]), [1, 2, 3, 4, 3, 4, 5])
    assert_equal(@obj.run([1,2,3,[4,3,[1,2,3]],4,[5]]), [1, 2, 3, 4, 3, 1, 2, 3, 4, 5])
  end
end