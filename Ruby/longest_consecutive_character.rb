class LongestConsecutiveCharacter
  def run(str)
    hash = {}
    previous_char = str[0]
    streak = 0

    str.split('').each do |char|
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

    hash.max_by{|k, v| v}
  end
end