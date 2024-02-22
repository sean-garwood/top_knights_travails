# frozen_string_literal: true

# represent each square on a chessboard
class Square
  include Coordinates
  attr_accessor :distance
  attr_reader :coordinates, :name, :unvisited_neighbors, :valid

  def initialize(board, coordinates, distance = MAX_DISTANCE)
    @name = label(coordinates)
    @coordinates = coordinates
    @distance = distance
    @valid = legal_moves.to_set
    @unvisited_neighbors = unvisited_adjacent(board)
  end

  def to_s
    "#{distance + 1}. #{name}"
  end
end
