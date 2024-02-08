# frozen_string_literal: true

require_relative 'node/comparable'

# element in a binary search tree.
class Node
  include Comparable
  attr_accessor :coords, :left, :right
  attr_reader :kids

  def initialize(coords)
    @coords = coords
    @left = nil
    @right = nil
    @kids = -> { [@left, @right] }
  end

  def height
    return -1 if coords.nil?

    lh = @left.nil? && -1 || @left.height
    rh = @right.nil? && -1 || @right.height
    [lh, rh].max + 1
  end

  def leaf?
    @left.nil? && @right.nil?
  end

  def one_child?
    @left.nil? || @right.nil?
  end

  def parent_of?(child)
    if leaf?
      nil
    elsif one_child?
      @left.nil? ? @right.same?(child) : @left.same?(child)
    else
      @left.same?(child) || @right.same?(child)
    end
  end
end
