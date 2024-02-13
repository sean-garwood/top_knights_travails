# frozen_string_literal: true

require_relative 'board/empty'
require_relative 'board/pos'

# this will be the total space of the chessboard, where n in (2..64)
class Board
  attr_accessor :visited, :unvisited
  attr_reader :knight, :target

  def initialize
    @knight = Square.new([0, 0], 0)
    @target = Square.new([7, 7])
    @visited = [@knight]
    @unvisited = make_board
  end

  def visit_neighbors(square)
    square.moves.each do |move|
      curr = unvisited.select { |s| s.coordinates == move }[0]
      visited << unvisited.delete(curr)
      curr.distance > square.distance ? curr.distance = square.distance + 1 : nil
    end
  end

  private

  include Empty
  include Position
  def to_s
    unvisited.each do |square|
      puts square
    end
    "visited: #{visited}"
  end
end
