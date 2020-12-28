class GreatestCommonDivisor
  def run(list)
    map = {}
    list.each do |n|
      map[n] = divisors(n)
    end
    map.values.inject(:&).max
  end

  private

  def divisors(num)
    (1..num).to_a.keep_if do |n|
      (num % n).zero?
    end
  end
end