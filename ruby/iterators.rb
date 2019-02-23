require_relative 'data_structures/linked_list'

class Iterator
  def initialize(*list)
    @list = list
    @current_index = 0
  end

  def has_next?
    @current_index < @list.size
  end

  def next
    if has_next?
      val = @list[@current_index]
      @current_index += 1
      val
    end
  end
end

class IteratorOfIterators
  # must implement next and has_next in O(1)

  def initialize(*iterators)
    @list = LinkedList.new
    iterators.each do |iterator|
      if iterator.has_next?
        node = @list.add(iterator)
        @head ||= node
      end
    end
    @current = @head
  end

  def has_next?
    # must be O(1)

    return false if @current.nil?
    @current.value.has_next?
  end

  def next
    # must be O(1)

    if has_next?
      val = @current.value.next

      if @current.value.has_next?
        @current = @current.next
      else
        # current iterator is empty and needs to be removed
        @head = @current.next if @head == @current

        node_after_current = @current.next
        @current = node_after_current if @list.delete(@current.value)
      end

      # return @current to beginning if end reached - round robin
      @current = @head  if @current.nil? && @list.length.nonzero?

      val
    end
  end
end