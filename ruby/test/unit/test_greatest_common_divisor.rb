require_relative '../../greatest_common_divisor'
require 'test/unit'

class TestGreatestCommonDivisor < Test::Unit::TestCase

  def setup
    @obj = GreatestCommonDivisor.new
  end

  def test_run
    assert_equal(@obj.run([2, 3, 4, 5, 6]), 1)
    assert_equal(@obj.run([2, 4, 6, 8, 10]), 2)
  end
end