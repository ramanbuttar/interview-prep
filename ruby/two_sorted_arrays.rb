class TwoSortedArrays
  def run(list_a, list_b, k)

    if list_a.empty? && list_b.empty?
      return nil
    elsif list_a.any? && list_b.any?
      return [list_a[0], list_b[0]].min if k == 0
      return [list_a[0], list_b[0]].max if k == 1
    elsif list_a.empty?
      return list_b[k] if k == 0 || k == 1
    elsif list_b.empty?
      return list_a[k] if k == 0 || k == 1
    end

    a_index, b_index, count = 0, 0, 0

    while count != k
      if a_index < list_a.size && b_index >= list_b.size
        # reached b's end so keep incrementing a
        a_index += 1
        count += 1
        return list_a[a_index] if count == k
      elsif b_index < list_b.size && a_index >= list_a.size
        # reached a's end so keep incrementing b
        b_index += 1
        count += 1
        return list_b[b_index] if count == k
      elsif list_a[a_index] < list_b[b_index]
        # a is smaller than b so increment a
        a_index += 1
        count += 1
        return list_b[b_index] if count == k
      elsif list_b[b_index] < list_a[a_index]
        # b is smaller than a so increment b
        b_index += 1
        count += 1
        return list_a[a_index] if count == k
      end

      break if a_index >= list_a.size && b_index >= list_b.size
    end
  end
end