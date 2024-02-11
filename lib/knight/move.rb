# frozen_string_literal: true

# choose next square
module Move
  COLS = (0..7).freeze
  MOVES = [
    [1, 2], [2, 1], [-1, 2], [-2, 1], [-1, -2], [-2, -1], [1, -2], [2, -1]
  ].freeze

  # two ways to weigh candidate moves:
  #   reduce distance between pos and target
  #   goto most connections unless target == 2, then prefer 6 in same quad
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
