# frozen_string_literal: true

# choose next square
module Move
  COLS = (0..7).freeze
  MAX_DISTANCE = 6
  MIN_DISTANCE = 0
  MOVES = [
    [1, 2], [2, 1], [-1, 2], [-2, 1], [1, -2], [2, -1], [-1, -2], [-2, -1]
  ].freeze

  def coords
    result = []
    cols = COLS
    rows = cols
    COLS.each do |col|
      rows.each do |row|
        result << [row, col]
      end
    end
    result
  end

  def legal_moves
    moves = MOVES
    t = proc { |dx, dy| [x + dx, y + dy] }
    moves.reduce([]) do |legal, move|
      new_move = t.call(move)

      legal << new_move if new_move.all? { |coord| COLS.include?(coord) }
      legal
    end
  end

  def find_next(square)
    candidates = unvisited.select { |s| square.moves.include?(s.coordinates) }
    candidates.include?(target) ? target : candidates[0]
  end
end
