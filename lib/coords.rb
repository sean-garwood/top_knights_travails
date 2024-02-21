# frozen_string_literal: true

# board coords
module Coordinates
  FILES = %w[a b c d e f g h].freeze
  RANKS = %w[1 2 3 4 5 6 7 8].freeze
  MAX_DISTANCE = 6
  MIN_DISTANCE = 0
  SHIFTS = [
    [1, 2], [2, 1], [-1, 2], [-2, 1], [1, -2], [2, -1], [-1, -2], [-2, -1]
  ].freeze

  def label(coords)
    files[coords[0]] + ranks[coords[1]]
  end

  def legal_moves
    SHIFTS.each_with_object([]) do |shift, legal|
      move_by = proc do
        dx = @coordinates[0] + shift[0]
        dy = @coordinates[1] + shift[1]
        [dx, dy]
      end
      new_move = move_by.call
      next if new_move.any? { |c| c.negative? || c > 7 }

      legal << new_move
    end
  end

  def playing_area
    coordinates = []
    FILES.each_index do |i|
      RANKS.each_index do |j|
        coordinates << [i, j]
      end
    end
    coordinates
  end

  def unvisited_neighbors(square)
    all = square.neighbors
    all.select { |n| n.visited.nil? }
  end
end
