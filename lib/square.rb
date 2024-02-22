# frozen_string_literal: true

# represent each square on a chessboard
class Square
  include Coordinates
  attr_accessor :distance
  attr_reader :coordinates, :name, :neighbors, :valid

  def initialize(board, coordinates, distance = MAX_DISTANCE)
    @name = label(coordinates)
    @coordinates = coordinates
    @distance = distance
    @valid = legal_moves.to_set
    @neighbors = unvisited_neighbors(board) unless @coordinates == board.destination
  end

  def to_s
    "#{coordinates}: dist #{distance}\n\n"
  end
end
