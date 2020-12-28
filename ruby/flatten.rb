class Flatten
  def run(list, output=[])
    list.each do |item|
      if item.is_a?(Array)
        run(item, output)
      else
        output << item
      end
    end
    output
  end
end