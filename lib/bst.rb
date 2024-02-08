# frozen_string_literal: true

require_relative 'bst/edit'
require_relative 'bst/print_tree'
require_relative 'bst/search'
require_relative 'bst/traverse'

# Build BST from an array.
class Tree
  include Comparable
  include Edit
  include PrintTree
  include Search
  include Traverse
  attr_accessor :root
  attr_reader :arr, :leftmost, :rightmost, :levels

  def initialize(arr = [])
    @arr = arr.uniq.sort
    @root = build_tree(@arr)
  end

  def depth(node, curr = @root)
    return 0 if curr.leaf? || node.same?(curr)

    d = 1
    any_kids_same = ->(n, c) { c.kids.call.any? { |k| n.same?(k) } }
    until node.same?(curr) || any_kids_same.call(node, curr)
      return d + 1 if any_kids_same.call(node, curr)

      d += 1
      if curr.one_child?
        curr = curr.kids.call[0]
      else
        node.greater_than?(curr) ? curr = curr.right : curr = curr.left
      end
    end
    d
  end

  def balanced?
    [0, 1].include?((root.right.height - root.left.height).abs)
  end

  private

  attr_writer :arr

  def build_tree(arr)
    mid = arr.length / 2
    node = Node.new(arr[mid])
    return node if mid.zero?

    node.left = build_tree(arr[..mid - 1]) unless arr[..mid - 1].empty?
    node.right = build_tree(arr[mid + 1..]) unless arr[mid + 1..].empty?
    node
  end
end
