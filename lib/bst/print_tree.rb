# frozen_string_literal: true

# print trees and subtrees gracefully to the console.
# i stole this mod.
module PrintTree
  def print_tree(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def to_s
    "
    \n#{print_tree}\n
    ------------------------------------\n
    "
  end
end
