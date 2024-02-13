# frozen_string_literal: true

require_relative 'board/empty'
require_relative 'board/pos'

# this will be the total space of the chessboard, where n in (2..64)
class Board
  attr_accessor :visited, :unvisited
  attr_reader :knight, :target

  def initialize
    @knight = Square.new([0, 0], 0)
    @target = Square.new([1, 2])
    @visited = [@knight]
    @unvisited = make_board
  end

  def visit_all
    loop do
      visit_neighbors(visited[-1])
      break if visited.map(&:coordinates).include?(target.coordinates)
    end
  end

  private

  include Empty
  include Position
  def visit_neighbors(square)
    unvisited_neighbors(square).each do |neighbor|
      visited << unvisited.delete(neighbor)
      puts neighbor.coordinates
      neighbor.distance > square.distance ? neighbor.distance = square.distance + 1 : nil
    end
  end

  def unvisited_neighbors(square)
    candidates = square.moves
    candidates.select { |move| unvisited_coords.include?(move) }
    unvisited.select { |sq| candidates.include?(sq.coordinates) }
  end

  def to_s
    unvisited.each do |square|
      puts square
    end
    "visited: #{visited}"
  end
end
