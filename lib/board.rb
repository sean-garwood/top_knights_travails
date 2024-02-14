# frozen_string_literal: true

# this will be the total space of the chessboard, where n in (2..64)
class Board
  include Move
  attr_accessor :unvisited, :visited
  attr_reader :knight, :target

  def initialize(knight = Debug::K_POS, target = Debug::T_POS)
    @unvisited = fill_board
    @visited = []
    @knight = find_square(knight)
    @target = find_square(target)
  end

  private

  include Debug
  def find_square(coordinates)
    @unvisited.select { |s| s.coordinates == coordinates }[0]
  end

  def fill_board
    coords.reduce([]) do |squares, coords|
      squares << Square.new(coords)
      squares
    end
  end

  def to_s
    <<~OUTPUT
      unvisited: \n#{unvisited.map(&:to_s).join}
      knight: #{knight}
    OUTPUT
  end
end
