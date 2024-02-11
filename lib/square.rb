# frozen_string_literal: true

require_relative 'square/pos'

# represent each square on a chessboard
class Square
  attr_reader :x, :y, :quadrant, :coordinates

  def initialize(x, y)
    @x = x
    @y = y
    @quadrant = find_quad
    @coordinates = [x, y]
  end

  def each_coord
    block_given? && yield(x, y) || coordinates
  end

  private

  attr_writer :x, :y, :quadrant, :coordinates

  include Position
end
