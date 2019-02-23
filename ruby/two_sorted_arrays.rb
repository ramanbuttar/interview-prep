class TwoSortedArrays
  def run(a, b, k)

    if a.empty? && b.empty?
      return nil
    elsif a.any? && b.any?
      return [a[0], b[0]].min if k == 0
      return [a[0], b[0]].max if k == 1
    elsif a.empty?
      return b[k] if k == 0 || k == 1
    elsif b.empty?
      return a[k] if k == 0 || k == 1
    end

    a_index, b_index, count = 0, 0, 0

    while count != k
      if a_index < a.size && b_index >= b.size
        # reached b's end so keep incrementing a
        a_index += 1
        count += 1
        return a[a_index] if count == k
      elsif b_index < b.size && a_index >= a.size
        # reached a's end so keep incrementing b
        b_index += 1
        count += 1
        return b[b_index] if count == k
      elsif a[a_index] < b[b_index]
        # a is smaller than b so increment a
        a_index += 1
        count += 1
        return b[b_index] if count == k
      elsif b[b_index] < a[a_index]
        # b is smaller than a so increment b
        b_index += 1
        count += 1
        return a[a_index] if count == k
      end

      break if a_index >= a.size && b_index >= b.size
    end
  end
end