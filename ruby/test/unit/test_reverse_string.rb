require_relative '../../reverse_string'
require 'test/unit'

class TestReverseString < Test::Unit::TestCase

  def test_reverse_entire!
    assert_equal('this is a test.'.reverse_entire!, '.tset a si siht')
  end

  def test_reverse_words!
    assert_equal('this is a test.'.reverse_words!, 'test. a is this')
  end
end