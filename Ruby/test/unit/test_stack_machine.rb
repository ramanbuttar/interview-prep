require_relative '../../stack_machine'
require 'test/unit'

class TestStackMachine < Test::Unit::TestCase

  def setup
    @obj = StackMachine.new
  end

  def test_run
    assert_equal(@obj.run('13+62*7+*'), 76)
    assert_equal(@obj.run('11++'), -1)
  end
end