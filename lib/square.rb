# frozen_string_literal: true

require_relative 'square/move'

# represent each square on a chessboard
class Square
  include Move
  attr_accessor :distance, :visited
  attr_reader :coordinates, :x, :y, :moves

  def initialize(coordinates, distance = MAX_DISTANCE)
    @coordinates = coordinates
    @x = coordinates[0]
    @y = @coordinates[1]
    @distance = distance
    @visited = nil
    @moves = legal_moves
  end

  def to_s
    "move #{distance}: (#{x}, #{y})\n\n"
  end

  private

  include Comparable

  def <=>(other)
    distance < other.distance && -1 ||
      distance == other.distance && 0 ||
      distance > other.distance && 1 || nil
  end
end
