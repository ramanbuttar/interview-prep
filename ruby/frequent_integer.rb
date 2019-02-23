class FrequentInteger
  def run(list)
    hash = Hash.new(0) # 0 is default value of hashed entry
    list.each do |num|
      hash[num] += 1
    end
    hash.max_by{|_k, v| v}.first
  end
end