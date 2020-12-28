class BinarySearch
  def run(list, target, from=0, to=nil)
    to ||= list.size - 1
    return if from > to
    mid = (from + to) / 2
    if target < list[mid]
      run list, target, from, mid - 1
    elsif target > list[mid]
      run list, target, mid + 1, to
    else
      mid
    end
  end
end

