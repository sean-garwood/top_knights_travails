# frozen_string_literal: true

# represent each square on a chessboard
class Square
  include Coordinates
  attr_accessor :distance
  attr_reader :coordinates, :neighboring_coords

  def initialize(coordinates, distance = MAX_DISTANCE)
    @coordinates = coordinates
    @distance = distance
    @neighboring_coords = legal_moves
  end

  def to_s
    "#{coordinates}: dist #{distance}\n\n"
  end
end
