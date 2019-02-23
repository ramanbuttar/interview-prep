require 'tree' # https://github.com/evolve75/RubyTree

class Array
  def minus(b)
    self.zip(b).map { |x, y| x - y }
  end

  def zero?
    self.any? { |x| x <= 0 }
  end

  def zero_or_negative?
    self.all? { |x| x <= 0 }
  end
end

class FuzzySodaDispenser
  def self.custom_content(label, min, max)
    {
        label: label,
        min: min,
        max: max
    }
  end

  SMALL = self.custom_content('Small', 215, 240)
  MEDIUM = self.custom_content('Medium', 290, 310)
  LARGE = self.custom_content('Large', 500, 515)

  attr_accessor :tree

  def initialize(min_capacity, max_capacity)
    @tree = Tree::TreeNode.new('ROOT', self.class.custom_content('root', min_capacity, max_capacity))
  end

  def create
    i = 1
    list = [@tree]
    while !list.empty?
      node = list.shift

      diff = diff(node, SMALL)
      small_end_reached = diff.zero_or_negative?
      unless small_end_reached
        new_node = Tree::TreeNode.new("#{SMALL[:label]}_#{i}", self.class.custom_content(SMALL[:label], *diff))
        node << new_node
        list.push(new_node)
      end

      diff = diff(node, MEDIUM)
      medium_end_reached = diff.zero_or_negative?
      unless medium_end_reached
        new_node = Tree::TreeNode.new("#{MEDIUM[:label]}_#{i}", self.class.custom_content(MEDIUM[:label], *diff))
        node << new_node
        list.push(new_node)
      end

      diff = diff(node, LARGE)
      large_end_reached = diff.zero_or_negative?
      unless large_end_reached
        new_node = Tree::TreeNode.new("#{LARGE[:label]}_#{i}", self.class.custom_content(LARGE[:label], *diff))
        node << new_node
        list.push(new_node)
      end

      if small_end_reached && medium_end_reached && large_end_reached
        next
      else
        i += 1
      end
    end
  end

  def leaf_nodes_sorted
    @tree.each_leaf.sort_by do |node|
      [node.content[:min], node.content[:max]]
    end
  end
  
  def leaf_nodes_with_lowest_min_capacity
    nodes = []
    min_val = @tree.content[:min]
    @tree.each_leaf do |node|
      if node.content[:min] < min_val
        # a new minimum is found - reset nodes list
        min_val = node.content[:min]
        nodes = [node]
      elsif node.content[:min] == min_val
        nodes.push(node)
      end
    end
    nodes
  end

  def one_leaf_node_solution_to_hash
    solution = leaf_nodes_with_lowest_min_capacity.first

    hash = {
        SMALL[:label] => 0,
        MEDIUM[:label] => 0,
        LARGE[:label] => 0
    }

    # parentage starts at solution node's parent so count solution node manually
    hash[solution.content[:label]] += 1

    solution.parentage.each do |path_node|
      next if path_node == @tree
      label = path_node.content[:label]
      if hash.has_key?(label)
        hash[label] += 1
      else
        hash[label] = 1
      end
    end
    hash
  end

  def pretty_solution
    result = one_leaf_node_solution_to_hash

    small_count = result[SMALL[:label]]
    medium_count = result[MEDIUM[:label]]
    large_count = result[LARGE[:label]]
    total_min_amount = (small_count * SMALL[:min]) + (medium_count * MEDIUM[:min]) + (large_count * LARGE[:min])
    total_max_amount = (small_count * SMALL[:max]) + (medium_count * MEDIUM[:max]) + (large_count * LARGE[:max])

    puts "#{small_count} x #{SMALL[:label]}"
    puts "#{medium_count} x #{MEDIUM[:label]}"
    puts "#{large_count} x #{LARGE[:label]}"
    puts "Requested Capacity: #{@tree.content[:min]}, #{@tree.content[:max]}"
    puts "Delivered Capacity: #{total_min_amount}, #{total_max_amount}"
    puts "Unused Capacity: #{total_min_amount - @tree.content[:min]}, #{@tree.content[:max] - total_max_amount}"
  end

  private

  def diff(node, size)
    [node.content[:min], node.content[:max]].minus([size[:min], size[:max]])
  end

end

f = FuzzySodaDispenser.new(1900, 2000)
f.create
puts f.pretty_solution