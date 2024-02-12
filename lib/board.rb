# frozen_string_literal: true

require_relative 'board/empty'

# this will be the total space of the chessboard, where n in (2..64)
class Board
  attr_accessor :squares
  attr_reader :knight, :target

  def initialize(knight, target)
    @knight = knight # some coordinates
    @target = target # more coords
    @squares = empty_board # generate squares using knight as starting point
  end

  private

  include Empty
  def to_s
    "squares: #{squares}"
  end
end
