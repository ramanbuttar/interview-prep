class MovingAverage
  def run(list, n)
    result = []
    window = []

    list.each do |num|
      window.push(num)

      if window.size == n
        avg = window.reduce(&:+) / n.to_f # divide by zero error here
        result.push(avg)

        window.shift
      end
    end

    result
  end
end