# frozen_string_literal: true

# Search for nodes in the BST.
module Search
  def scan_for(node, curr = root)
    return curr if yield(curr)

    next_dir = proc { |n, c| n.less_than?(c) ? c.left : c.right }

    until yield(curr)
      return curr if next_dir.call(node, curr).nil?

      curr = next_dir.call(node, curr)
    end
    curr
  end

  def find(data)
    return if root.nil?

    node = Node.new(data)
    closest = scan_for(node) { |curr| (curr.leaf? || node.same?(curr)) }
    closest.same?(node) && closest || nil
  end
end
