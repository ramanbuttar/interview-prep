class IntProduct
  def run(list)
    result = []
    list.each do |int|
      copy = list.clone
      copy.delete(int)
      result.push(copy.reduce(&:*))
    end
    result
  end
end