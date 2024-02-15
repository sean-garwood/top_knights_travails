# frozen_string_literal: true

require_relative 'board/output'

# this will be the total space of the chessboard, where n in (2..64)
class Board
  include Move
  include Output
  attr_reader :path

  def initialize(knight = [0, 7], target = [7, 0])
    @squares = fill_board
    @unvisited = @squares
    @visited = []
    @knight = find(knight)
    @knight.distance = 0
    @target = find(target)
    visit_relevant_squares
    @path = visited
  end

  private

  attr_accessor :unvisited, :visited
  attr_reader :squares, :knight, :target

  include Debug
  def find(coordinates)
    @unvisited.select { |s| s.coordinates == coordinates }[0]
  end

  def fill_board
    coords.reduce([]) do |squares, coords|
      squares << Square.new(coords)
      squares
    end
  end

  def visit(square)
    unvisited.select { |s| square.moves.include?(s.coordinates) }.each do |n|
      n >= square && n.distance = square.distance + 1
    end
    visited << unvisited.delete(square) unless square.visited
    square.visited = true
    square
  end

  def visit_relevant_squares(curr = knight)
    while @unvisited.include?(target) && @unvisited.any?
      visit(curr)
      curr = find_next(curr)
    end
  end

  def knight_moves
    on_path = visited.reject do |square|
      square > target
    end
    on_path.map(&:coordinates)
  end
end
