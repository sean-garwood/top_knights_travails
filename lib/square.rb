# frozen_string_literal: true

require_relative 'square/move'

# represent each square on a chessboard
class Square
  include Move
  attr_accessor :distance
  attr_reader :coordinates, :x, :y, :moves

  def initialize(coordinates, distance = MAX_DISTANCE)
    @coordinates = coordinates
    @distance = distance
    @x = coordinates[0]
    @y = coordinates[1]
    @moves = moves
  end

  private

  def to_s
    "#{x}, #{y}\ndistance to knight: #{distance}"
  end
end
