# frozen_string_literal: true

# compare nodes using data.
module Comparable
  def compare(nodes)
    no_nils = nodes.map { |node| node.data.nil? ? 0 : node.data }
    no_nils[0] <=> no_nils[1]
  end

  def same?(other)
    compare([self, other]).zero?
  end

  def less_than?(other)
    compare([self, other]).negative?
  end

  def greater_than?(other)
    compare([self, other]).positive?
  end
end
