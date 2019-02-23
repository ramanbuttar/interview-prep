require_relative '../../reverse_even'
require 'test/unit'

class TestReverseEven < Test::Unit::TestCase

  def setup
    @obj = ReverseEven.new
  end

  def test_run
    assert_equal(@obj.run('12435'), '14235')
    assert_equal(@obj.run('124356'), '164352')
  end
end