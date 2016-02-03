class LinkedList
  def initialize(*vals)
    @head = nil
    @tail = nil
    @length = 0
    vals.each do |value|
      add(value)
    end
  end

  def search(value)
    node = @head
    while node != nil
      return node if node.value == value
      node = node.next
    end
  end

  def add(value)
    node = Node.new(value)
    @head = node if @head.nil?
    if @tail.nil?
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
    @length += 1
    node
  end

  def delete(value)
    return false if @length.zero?

    if @head.value == value
      @head = @head.next
      @length -= 1
      return true
    end

    node = @head
    next_node = node.next
    while next_node != nil
      if next_node.value == value
        @tail = node if next_node == @tail
        node.next = next_node.next
        @length -= 1
        return true
      end
      node = node.next
      next_node = next_node.next
    end
    false
  end

  def to_array
    array = []
    node = @head
    while node != nil
      array << node.value
      node = node.next
    end
    array
  end

  def length
    @length
  end

  def print
    puts self.to_array.inspect
  end

end

class Node
  attr_reader :value
  attr_accessor :next

  def initialize(value)
    @value = value
    @next = nil
  end
end