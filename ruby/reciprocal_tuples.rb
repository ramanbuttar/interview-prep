class ReciprocalTuples
  def run(list)
    hash = {}
    list.each do |tuple|
      hash[tuple] ||= false
    end

    count = 0

    hash.each do |tuple, val|
      next if val == true # already looked at this tuple

      reverse_tuple = tuple.reverse
      if hash.has_key?(reverse_tuple)
        count += 1
        hash[tuple] = true
        hash[reverse_tuple] = true
      end
    end
    count
  end
end