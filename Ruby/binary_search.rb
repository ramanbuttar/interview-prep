class BinarySearch
  def run(arr, t, from=0, to=nil)
    to ||= arr.size - 1
    return if from > to
    mid = (from + to ) / 2
    if arr[mid] > t
      run arr, t, from, mid - 1
    elsif arr[mid] < t
      run arr, t, mid + 1, to
    else
      mid
    end
  end
end

