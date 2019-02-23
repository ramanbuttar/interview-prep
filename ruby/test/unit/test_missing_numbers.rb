require_relative '../../missing_numbers'
require 'test/unit'

class TestMissingNumbers < Test::Unit::TestCase

  def setup
    @obj = MissingNumbers.new
  end

  def test_run
    assert_equal(@obj.run([0, 1, 5, 7, 27, 54, 55, 56, 100]), [[2, 4], 6, [8, 26], [28, 53], [57, 99]])
  end
end