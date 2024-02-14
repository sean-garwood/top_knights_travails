# frozen_string_literal: true

require_relative 'square/move'

# represent each square on a chessboard
class Square
  include Move
  attr_accessor :distance, :visited
  attr_reader :coordinates, :x, :y, :neighbors

  def initialize(coordinates, distance = MAX_DISTANCE)
    @coordinates = coordinates
    @distance = distance
    @visited = nil
    @x = coordinates[0]
    @y = @coordinates[1]
  end

  def to_s
    <<~OUTPUT
      (#{x}, #{y})\n    distance: #{distance}
    OUTPUT
  end
end
