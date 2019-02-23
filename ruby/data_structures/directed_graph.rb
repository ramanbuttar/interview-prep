require 'set'

class Node
  attr_reader :content
  def initialize(content)
    @content = content
  end
end

class DirectedGraph
  def initialize
    self.empty!
  end

  def add_node(content)
    raise DuplicateContentNodeError.new("Node with content #{content} already exists") if @nodes.has_key?(content)

    node = Node.new(content)
    @nodes[content] = node
  end

  def add_edge(from_content, to_content)
    from_node = @nodes[from_content]
    to_node = @nodes[to_content]

    raise ContentNodeNotFoundError.new("Node with content #{from_content} not found") if from_node.nil?
    raise ContentNodeNotFoundError.new("Node with content #{to_content} not found") if to_node.nil?
    raise SelfEdgeError.new('Cannot set edge to self') if from_node == to_node

    @edges[from_node] = Set.new unless @edges.has_key?(from_node)
    @edges[from_node].add(to_node)
  end

  def nodes_count
    @nodes.values.length
  end

  def has_edge?(from_content, to_content)
    from_node = @nodes[from_content]
    to_node = @nodes[to_content]

    return false if from_node.nil? || to_node.nil?
    return false if @edges[from_node].nil?

    @edges[from_node].include?(to_node)
  end

  def directed_neighbours(content)
    directed_neighbouring_nodes(content).map(&:content)
  end

  def empty!
    @nodes = {}
    @edges = {}
  end

  def longest_path
    # TODO - https://en.wikipedia.org/wiki/Longest_path_problem
    @nodes.each_value do |node|
      directed_neighbouring_nodes(node.content)


    end
  end

  private
  def directed_neighbouring_nodes(content)
    node = @nodes[content]
    raise ContentNodeNotFoundError.new("Node with content #{content} not found") if node.nil?

    @edges[node].to_a
  end
end

class DuplicateContentNodeError < StandardError; end
class ContentNodeNotFoundError < StandardError; end
class SelfEdgeError < StandardError; end