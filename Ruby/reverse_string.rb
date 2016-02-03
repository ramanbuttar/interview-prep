class String
  def reverse_entire!
    half_length = self.length / 2
    half_length.times do |i|
      self[i], self[-i-1] = self[-i-1], self[i]
    end
    self
  end

  def reverse_words!
    words = self.split(' ')
    half_count = words.count / 2
    half_count.times do |i|
      words[i], words[-i-1] = words[-i-1], words[i]
    end
    words.join(' ')
  end
end