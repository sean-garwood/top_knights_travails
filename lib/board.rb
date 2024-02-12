# frozen_string_literal: true

require_relative 'board/empty'

# this will be the total space of the chessboard, where n in (2..64)
class Board
  attr_accessor :visited, :unvisited
  attr_reader :knight, :target

  def initialize
    @knight = Square.new(coordinates_of('knight'), 0)
    @target = Square.new(coordinates_of('target'))
    @visited = [@knight]
    @unvisited = make_board
  end

  private

  include Empty
  def to_s
    unvisited.each do |square|
      puts square
    end
  end
end
