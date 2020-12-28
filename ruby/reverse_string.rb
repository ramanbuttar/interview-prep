class ReverseString
  def run(list)
    (list.length / 2).times do |i|
      list[i], list[-i-1] = list[-i-1], list[i]
    end
    list
  end
end

class String
  def reverse_entire!
    separator = ''
    list = self.split(separator)
    reversed_list = ReverseString.new.run(list)
    reversed_list.join(separator)
  end

  def reverse_words!
    separator = ' '
    list = self.split(separator)
    reversed_list = ReverseString.new.run(list)
    reversed_list.join(separator)
  end
end