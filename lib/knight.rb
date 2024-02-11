# frozen_string_literal: true

require_relative 'knight/choose'

# move about the board
class Knight < Square
  include Choose
  GO = {
    TALL: [1, 2],
    SHORT: [2, 1]
  }.freeze
  attr_accessor :pos, :distance
  attr_reader :x, :y, :neighbors, :start, :target

  def initialize(x, y, target, pos = coordinates)
    super(x, y)
    @start = coordinates.freeze
    @target = target # some square's coordinates
    @pos = pos
    @distance = distance_to_target
  end

  # possible moves:
  #   [x + 2, y + 1]
  #   [x + 2, y - 1]
  #   [x - 2, y + 1]
  #   [x - 2, y - 1]
  #   [x + 1, y + 2]
  #   [x + 1, y - 2]
  #   [x - 1, y + 2]
  #   [x - 1, y - 2]
  #   only really care about the two that go toward the target
  #     target is a 2 is a special case--need to get to a six then

  # two ways to weigh candidate moves:
  #   reduce distance between pos and target
  #   goto most connections unless target == 2, then prefer 6 in same quad

  def distance_to_target
    (x - target.x).abs + (y - target.y).abs
  end

  def check_neighbors
    # need to yield an array of valid neighboring squares
    #   2 <= len <= 8

    # need:
    #   coordinates
    #   SHIFTS
    #   four directional mappings ([DOWN, LEFT])

    # algo
    #   accumulator is an array
    #   reduce
  end

  def legal?
    COLS.include?(pos)
  end

  private

  def to_s
    "knight start at: #{start}\ntarget coords: #{target.coordinates}\ndistance: #{distance}"
  end
end
