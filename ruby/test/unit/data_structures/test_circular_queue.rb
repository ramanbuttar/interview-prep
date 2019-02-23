require_relative '../../../data_structures/circular_queue'
require 'test/unit'

class TestCircularQueue < Test::Unit::TestCase

  def setup
    @obj = CircularQueue.new(4)
  end

  def test_empty_exception_message
    exception = assert_raise(Exception) { @obj.pop_from_front }
    assert_equal('too empty', exception.message)
  end

  def test_full_exception_message
    @obj.push_to_back(1)
    @obj.push_to_back(2)
    @obj.push_to_back(3)
    @obj.push_to_back(4)
    exception = assert_raise(Exception) { @obj.push_to_back(5) }
    assert_equal('too full while inserting 5', exception.message)
  end

  def test_length
    @obj.push_to_back(1)
    @obj.push_to_back(2)
    @obj.push_to_back(3)
    @obj.push_to_back(4)
    assert_equal(@obj.length, 4)
  end

  def test_pop_from_front
    @obj.push_to_back(1)
    @obj.push_to_back(2)
    @obj.push_to_back(3)
    @obj.push_to_back(4)
    assert_equal(@obj.length, 4)
    assert_equal(@obj.pop_from_front, 1)
    assert_equal(@obj.length, 3)
  end

  def test_usage
    @obj.push_to_back(1)
    @obj.push_to_back(2)
    @obj.push_to_back(3)
    @obj.push_to_back(4)
    assert_equal(@obj.length, 4)
    assert_equal(@obj.pop_from_front, 1)
    assert_equal(@obj.pop_from_front, 2)
    assert_equal(@obj.length, 2)
    @obj.push_to_back(5)
    @obj.push_to_back(6)
    assert_equal(@obj.length, 4)
    exception = assert_raise(Exception) { @obj.push_to_back(7) }
    assert_equal('too full while inserting 7', exception.message)
  end
end