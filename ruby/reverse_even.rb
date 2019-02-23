class ReverseEven
  def run(str)
    front = nil
    back = nil

    str.size.times do |i|
      if front.nil? && str[i].to_i % 2 == 0
        front = i
      end
      if back.nil? && str[str.size - i - 1].to_i % 2 == 0
        back = str.size - i - 1
      end
      if front && back && front < back
        str[front], str[back] = str[back], str[front]
        front = nil
        back = nil
      end
    end
    str
  end
end