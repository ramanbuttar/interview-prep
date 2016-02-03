require_relative '../../iterators'
require 'test/unit'

class TestIterator < Test::Unit::TestCase

  def test_empty
    it = Iterator.new

    assert_false(it.has_next?)
    assert_nil(it.next)
  end

  def test_one
    it = Iterator.new('1')

    assert_true(it.has_next?)
    assert_equal(it.next, '1')

    assert_false(it.has_next?)
    assert_nil(it.next)
  end

  def test_multiple
    it = Iterator.new('1', '2')

    assert_true(it.has_next?)
    assert_equal(it.next, '1')

    assert_true(it.has_next?)
    assert_equal(it.next, '2')

    assert_false(it.has_next?)
    assert_nil(it.next)
  end
end

class TestIteratorOfIterators < Test::Unit::TestCase

  def test_empty
    its = IteratorOfIterators.new

    assert_false(its.has_next?)
    assert_nil(its.next)
  end

  def test_one_empty_iterator
    iterators = Iterator.new
    its = IteratorOfIterators.new(iterators)

    assert_false(its.has_next?)
    assert_nil(its.next)
  end

  def test_one_iterator_filled_once
    iterators = Iterator.new('1')
    its = IteratorOfIterators.new(iterators)

    assert_true(its.has_next?)
    assert_equal(its.next, '1')

    assert_false(its.has_next?)
    assert_nil(its.next)
  end

  def test_one_iterator_filled_multiple_times
    iterators = Iterator.new('1', '2')
    its = IteratorOfIterators.new(iterators)

    assert_true(its.has_next?)
    assert_equal(its.next, '1')

    assert_true(its.has_next?)
    assert_equal(its.next, '2')

    assert_false(its.has_next?)
    assert_nil(its.next)
  end

  def test_multiple_empty_iterators
    iterators = [Iterator.new, Iterator.new]
    its = IteratorOfIterators.new(*iterators)

    assert_false(its.has_next?)
    assert_nil(its.next)
  end

  def test_multiple_iterators_filled_multiple_times_with_same_length
    iterators = [Iterator.new(1, 2), Iterator.new('a', 'b'), Iterator.new(3.0, 4.0)]
    its = IteratorOfIterators.new(*iterators)

    assert_true(its.has_next?)
    assert_equal(its.next, 1)

    assert_true(its.has_next?)
    assert_equal(its.next, 'a')

    assert_true(its.has_next?)
    assert_equal(its.next, 3.0)

    assert_true(its.has_next?)
    assert_equal(its.next, 2)

    assert_true(its.has_next?)
    assert_equal(its.next, 'b')

    assert_true(its.has_next?)
    assert_equal(its.next, 4.0)

    assert_false(its.has_next?)
    assert_nil(its.next)
  end

  def test_multiple_iterators_filled_multiple_times_with_different_lengths_head
    iterators = [Iterator.new(1), Iterator.new('a', 'b'), Iterator.new(3.0, 4.0)]
    its = IteratorOfIterators.new(*iterators)

    assert_true(its.has_next?)
    assert_equal(its.next, 1)

    assert_true(its.has_next?)
    assert_equal(its.next, 'a')

    assert_true(its.has_next?)
    assert_equal(its.next, 3.0)

    assert_true(its.has_next?)
    assert_equal(its.next, 'b')

    assert_true(its.has_next?)
    assert_equal(its.next, 4.0)

    assert_false(its.has_next?)
    assert_nil(its.next)
  end

  def test_multiple_iterators_filled_multiple_times_with_different_lengths_tail
    iterators = [Iterator.new(1, 2), Iterator.new('a', 'b'), Iterator.new(3.0)]
    its = IteratorOfIterators.new(*iterators)

    assert_true(its.has_next?)
    assert_equal(its.next, 1)

    assert_true(its.has_next?)
    assert_equal(its.next, 'a')

    assert_true(its.has_next?)
    assert_equal(its.next, 3.0)

    assert_true(its.has_next?)
    assert_equal(its.next, 2)

    assert_true(its.has_next?)
    assert_equal(its.next, 'b')

    assert_false(its.has_next?)
    assert_nil(its.next)
  end

  def test_multiple_iterators_filled_multiple_times_with_different_lengths
    iterators = [Iterator.new(1, 2), Iterator.new('a'), Iterator.new(3.0, 4.0)]
    its = IteratorOfIterators.new(*iterators)

    assert_true(its.has_next?)
    assert_equal(its.next, 1)

    assert_true(its.has_next?)
    assert_equal(its.next, 'a')

    assert_true(its.has_next?)
    assert_equal(its.next, 3.0)

    assert_true(its.has_next?)
    assert_equal(its.next, 2)

    assert_true(its.has_next?)
    assert_equal(its.next, 4.0)

    assert_false(its.has_next?)
    assert_nil(its.next)
  end

end