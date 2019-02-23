require_relative '../../competing_cells'
require 'test/unit'

class TestCompetingCells < Test::Unit::TestCase

  def setup
    @obj = CompetingCells.new
  end

  def test_run
    assert_equal(@obj.run([1, 0, 0, 0, 0, 1, 0, 0], 1), [0, 1, 0, 0, 1, 0, 1, 0])
    assert_equal(@obj.run([1, 1, 1, 0, 1, 1, 1, 1], 2), [0, 0, 0, 0, 0, 1, 1, 0])
  end
end