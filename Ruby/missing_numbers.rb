class MissingNumbers
  def run(list)
    ranges = []
    prev_num = list[0]
    list.each do |num|
      range = []
      if num - prev_num == 2
        ranges << num - 1
      elsif num - prev_num > 2
        ranges << [prev_num + 1, num - 1]
      end

      prev_num = num
    end
    ranges
  end
end