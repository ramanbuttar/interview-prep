require_relative '../../longest_consecutive_character'
require 'test/unit'

class TestLongestConsecutiveCharacter < Test::Unit::TestCase

  def setup
    @obj = LongestConsecutiveCharacter.new
  end

  def test_run
    assert_equal(@obj.run('ab'), ['a', 1])
    assert_equal(@obj.run('abab'), ['a', 1])
    assert_equal(@obj.run('aabbab'), ['a', 2])
    assert_equal(@obj.run('aabbccaaa'), ['a', 3])
    assert_equal(@obj.run('aaccccccbbcccccaaa'), ['c', 6])
  end

end