class MaxSlice
  def run(array)
    max_start, max_end, max_sum = 0, 0, 0
    current_start, current_end, current_sum = 0, 0, 0

    for index in 0..array.size - 1
      if current_sum + array[index] <= 0
        current_sum = 0
        current_start = index + 1
      elsif current_sum + array[index] > current_sum
        current_sum += array[index]
        current_end = index
        if current_sum > max_sum
          max_sum = current_sum
          max_start, max_end = current_start, current_end
        end
      end
    end
    slice = array[max_start..max_end]
    sum = slice.reduce(&:+)
    [slice, sum]
  end
end