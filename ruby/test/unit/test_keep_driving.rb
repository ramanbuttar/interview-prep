require_relative '../../keep_driving'
require 'test/unit'

class TestKeepDriving < Test::Unit::TestCase

  def setup
    @obj = KeepDriving.new
  end

  def test_run
    assert_false(@obj.run([[0, 6], [10, 12], [16, 20]]))
    assert_true(@obj.run([[0, 4], [12, 15], [19, 22], [24, 26]]))
    assert_false(@obj.run([[0, 4], [12, 15], [19, 22], [24, 26], [28, 32]]))
    assert_false(@obj.run([[0, 12], [13, 15]]))
  end
end