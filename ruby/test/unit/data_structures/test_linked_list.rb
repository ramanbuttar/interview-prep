require_relative '../../../data_structures/linked_list'
require 'test/unit'

class TestLinkedList < Test::Unit::TestCase

  def test_empty
    li = LinkedList.new
    assert_equal(li.length, 0)
    assert_empty(li.to_array)
  end

  def test_add_to_empty
    li = LinkedList.new
    assert_equal(li.length, 0)
    assert_empty(li.to_array)

    assert_not_nil(li.add('a'))
    assert_equal(li.length, 1)
    assert_equal(li.to_array, ['a'])

    assert_not_nil(li.add('b'))
    assert_equal(li.length, 2)
    assert_equal(li.to_array, ['a', 'b'])
  end

  def test_add_to_existing
    li = LinkedList.new('a', 'b', 'c')
    assert_equal(li.length, 3)
    assert_equal(li.to_array, ['a', 'b', 'c'])

    assert_not_nil(li.add('d'))
    assert_equal(li.length, 4)
    assert_equal(li.to_array, ['a', 'b', 'c', 'd'])

    assert_not_nil(li.add('e'))
    assert_equal(li.length, 5)
    assert_equal(li.to_array, ['a', 'b', 'c', 'd', 'e'])
  end

  def test_delete_head
    li = LinkedList.new('a', 'b', 'c')
    assert_equal(li.length, 3)
    assert_equal(li.to_array, ['a', 'b', 'c'])

    assert_true(li.delete('a'))
    assert_equal(li.length, 2)
    assert_equal(li.to_array, ['b', 'c'])
  end

  def test_delete_tail
    li = LinkedList.new('a', 'b', 'c')
    assert_equal(li.length, 3)
    assert_equal(li.to_array, ['a', 'b', 'c'])

    assert_true(li.delete('c'))
    assert_equal(li.length, 2)
    assert_equal(li.to_array, ['a', 'b'])
  end

  def test_delete
    li = LinkedList.new('a', 'b', 'c')
    assert_equal(li.length, 3)
    assert_equal(li.to_array, ['a', 'b', 'c'])

    assert_true(li.delete('b'))
    assert_equal(li.length, 2)
    assert_equal(li.to_array, ['a', 'c'])
  end

  def test_delete_to_empty
    li = LinkedList.new('a', 'b', 'c')
    assert_equal(li.length, 3)
    assert_equal(li.to_array, ['a', 'b', 'c'])

    assert_true(li.delete('b'))
    assert_true(li.delete('c'))
    assert_true(li.delete('a'))
    assert_equal(li.length, 0)
    assert_empty(li.to_array)
  end

  def test_delete_from_empty
    li = LinkedList.new
    assert_equal(li.length, 0)
    assert_empty(li.to_array)

    assert_false(li.delete('a'))
    assert_equal(li.length, 0)
    assert_empty(li.to_array)
  end

  def test_delete_invalid_value
    li = LinkedList.new('a', 'b', 'c')
    assert_equal(li.length, 3)
    assert_equal(li.to_array, ['a', 'b', 'c'])

    assert_false(li.delete('d'))
    assert_equal(li.length, 3)
    assert_equal(li.to_array, ['a', 'b', 'c'])
  end

  def test_search_head
    li = LinkedList.new('a', 'b', 'c')
    assert_equal(li.search('a').value, 'a')
  end

  def test_search_tail
    li = LinkedList.new('a', 'b', 'c')
    assert_equal(li.search('c').value, 'c')
  end

  def test_search
    li = LinkedList.new('a', 'b', 'c')
    assert_equal(li.search('b').value, 'b')
  end

  def test_search_invalid_value
    li = LinkedList.new('a', 'b', 'c')
    assert_nil(li.search('d'))
  end
end