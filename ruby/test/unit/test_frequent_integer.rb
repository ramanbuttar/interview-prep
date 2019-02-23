require_relative '../../frequent_integer'
require 'test/unit'

class TestFrequentInteger < Test::Unit::TestCase

  def setup
    @obj = FrequentInteger.new
  end

  def test_run
    assert_equal(@obj.run([1, 1, 2, 3, 4, 6, 7, 1, 2, 4, 2, 2]), 2)
  end
end