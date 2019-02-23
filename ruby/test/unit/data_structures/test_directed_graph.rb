require_relative '../../../data_structures/directed_graph'
require 'test/unit'

class TestDirectedGraph < Test::Unit::TestCase

  def setup
    @obj = DirectedGraph.new
  end

  def test_add_node
    @obj.add_node('a')
    assert_equal(@obj.nodes_count, 1)
  end

  def test_add_edge
    @obj.add_node('a')
    @obj.add_node('b')
    assert_equal(@obj.nodes_count, 2)

    assert_false(@obj.has_edge?('a', 'b')) # no edge added yet

    @obj.add_edge('a', 'b')
    assert_true(@obj.has_edge?('a', 'b'))

    assert_false(@obj.has_edge?('a', 'c'))
  end

  def test_directed_neighbours
    @obj.add_node('a')
    @obj.add_node('b')
    @obj.add_node('ba')
    @obj.add_node('bca')
    @obj.add_node('bda')
    @obj.add_node('bdca')
    @obj.add_node(6)

    @obj.add_edge('bdca', 'bca')
    @obj.add_edge('bdca', 'bda')
    @obj.add_edge('bca', 'ba')
    @obj.add_edge('bda', 'ba')
    @obj.add_edge('ba', 'a')
    @obj.add_edge('ba', 'b')

    assert_empty(@obj.directed_neighbours('bdca') - ['bda', 'bca'])
  end

end