# frozen_string_literal: true

# choose next square
module Move
  MAX_DISTANCE = 6
  MOVES = [
    [1, 2], [2, 1], [-1, 2], [-2, 1], [1, -2], [2, -1], [-1, -2], [-2, -1]
  ].freeze

  def legal_moves
    move_by_values = MOVES
    new_coords = proc do |move_x, move_y|
      coord = [x + move_x, y + move_y]
      coord if COLS.include?(coord[0]) && COLS.include?(coord[1])
    end
    move_by_values.reduce([]) do |moves, move|
      moves << new_coords.call(move[0], move[1])
    end.compact
  end
end
