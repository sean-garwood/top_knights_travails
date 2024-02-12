# frozen_string_literal: true

require_relative 'square/move'
require_relative 'square/pos'

# represent each square on a chessboard
class Square < Board
  include Move
  include Position
  attr_accessor :distance, :visited
  attr_reader :coordinates, :x, :y, :moves

  def initialize(coordinates = [0, 0])
    @coordinates = coordinates
    @x = coordinates[0]
    @y = coordinates[1]
    @moves = legal_moves
    @distance = MAX_DISTANCE # number of moves to target. Assumed to be max at init
    @visited = nil
  end
end
