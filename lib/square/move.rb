# frozen_string_literal: true

# choose next square
module Move
  MOVES = [
    [1, 2], [2, 1], [-1, 2], [-2, 1], [1, -2], [2, -1], [-1, -2], [-2, -1]
  ].freeze
  UP_RIGHT = MOVES[0..1].freeze
  UP_LEFT =  MOVES[2..3].freeze
  DOWN_RIGHT = MOVES[4..5].freeze
  DOWN_LEFT = MOVES[6..7].freeze

  def all_moves
    move_by_values = MOVES
    new_coords = proc { |move_x, move_y| [x + move_x, y + move_y] }
    move_by_values.reduce([]) do |moves, move|
      moves << new_coords.call(move[0], move[1])
    end
  end

  def legal_moves
    all_moves.select do |move|
      COLS.include?(move[0]) && COLS.include?(move[1])
    end
  end
end
