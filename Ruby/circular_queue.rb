class CircularQueue
  def initialize(capacity)
    @capacity = capacity
    @array = Array.new(@capacity)
    @front = 0
    @back = 0
    @length = 0
  end

  def length
    @length
  end

  def push_to_back(value)
    if length < @capacity
      @array[@back] = value
      @back +=1
      @length += 1
    else
      raise Exception.new("too full while inserting #{value}")
    end
    if @back >= @capacity
      @back = 0
    end
  end

  def pop_from_front
    if length > 0
      val = @array[@front]
      @array[@front] = nil
      @front += 1
      @length -= 1
      return val
    else
      raise Exception.new('too empty')
    end
    if @front >= @capacity
      @front = 0
    end
  end

  def print
    puts @array.inspect
  end
end