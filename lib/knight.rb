# frozen_string_literal: true

require_relative 'knight/move'

# move about the board
class Knight < Square
  include Move
  GO = {
    TALL: [1, 2],
    SHORT: [2, 1]
  }.freeze
  attr_accessor :pos, :distance, :candidates
  attr_reader :x, :y, :neighbors, :start, :target

  def initialize(x, y, target, pos = coordinates)
    super(x, y)
    @start = coordinates.freeze
    @target = target # some square's coordinates
    @pos = pos
    @distance = distance_to_target
    @candidates = legal_moves
  end

  private

  def distance_to_target
    (x - target.x).abs + (y - target.y).abs
  end

  def to_s
    "candidates: #{candidates}"
  end
end
