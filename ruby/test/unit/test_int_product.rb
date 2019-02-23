require_relative '../../int_product'
require 'test/unit'

class TestIntProduct < Test::Unit::TestCase

  def setup
    @obj = IntProduct.new
  end

  def test_run
    assert_equal(@obj.run([1, 7, 3, 4]), [84, 12, 28, 21])
  end
end