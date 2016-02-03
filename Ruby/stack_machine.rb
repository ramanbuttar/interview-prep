class StackMachine

  def run(s)
    stack = []

    s.split('').each do |char|
      if numeric?(char)
        # [0..9]
        num = char.to_i
        stack.push(num)
      elsif char == '+'
        # sum
        first, second = stack.pop(), stack.pop()
        return -1 if first.nil? || second.nil?
        sum = first + second
        stack.push(sum)
      elsif char == '*'
        # product
        first, second = stack.pop(), stack.pop()
        return -1 if first.nil? || second.nil?
        product = first * second
        stack.push(product)
      else
        # invalid character
        return -1
      end
    end
    stack.empty? ? -1 : stack.pop()
  end

  private

  def numeric?(char)
    (char =~ /[[:digit:]]/) == 0
  end

end