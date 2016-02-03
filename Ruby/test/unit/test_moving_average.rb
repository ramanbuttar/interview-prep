require_relative '../../moving_average'
require 'test/unit'

class TestMovingAverage < Test::Unit::TestCase

  def setup
    @obj = MovingAverage.new
  end

  def test_run
    assert_equal(@obj.run([1, 4, 7, 9, 1, 10], 4), [5.25, 5.25, 6.75])
  end
end