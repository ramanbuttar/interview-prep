class ReverseEven
  def run(string)
    front = nil
    back = nil

    string.size.times do |i|
      if front.nil? && string[i].to_i % 2 == 0
        front = i
      end
      if back.nil? && string[string.size - i - 1].to_i % 2 == 0
        back = string.size - i - 1
      end
      if front && back && front < back
        string[front], string[back] = string[back], string[front]
        front = nil
        back = nil
      end
    end
    string
  end
end