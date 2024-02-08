# frozen_string_literal: true

require_relative 'square/move'
require_relative 'square/pos'

# represent each square on a chessboard
class Square
  include Move
  attr_accessor :x, :y, :quadrant, :coordinates
  attr_reader :neighbors

  def initialize(x, y)
    @x = x if COLS.include?(x)
    @y = y if COLS.include?(y)
    @quadrant = find_quad
    @coordinates = [x, y]
    @neighbors = []
  end

  def each_coord
    block_given? && yield(x, y) || coordinates
  end

  private

  attr_writer :neighbors

  include Position
  def check_neighbors
    # need to yield an array of valid neighboring squares
    #   2 <= len <= 8

    # need:
    #   coordinates
    #   SHIFTS
    #   four directional mappings ([DOWN, LEFT])

    # algo
    #   accumulator is an array
    #   reduce
  end

  def make_board
    squares = []
    col_nums = COLS
    row_nums = col_nums
    col_nums.each do |col|
      row_nums.each do |row|
        squares << [row, col]
      end
    end
    squares
  end

  def to_s
    "quadrant: #{quadrant}"
  end
end
