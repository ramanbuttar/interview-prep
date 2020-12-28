class LongestConsecutiveCharacter
  def run(string)
    hash = {}
    previous_char = string[0]
    streak = 0

    string.chars.each do |char|
      if previous_char == char
        streak += 1
      else
        streak = 1
      end

      if hash[char].nil? || streak > hash[char]
        hash[char] = streak
      end

      previous_char = char
    end

    hash.max_by{|_k, v| v}
  end
end