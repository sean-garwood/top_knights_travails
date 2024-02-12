# frozen_string_literal: true

# make a set of squares for the chessboard
module Empty
  def empty_board
    coords = []
    rows = COLS
    COLS.each do |col|
      rows.each do |row|
        coords << [row, col]
      end
    end
    coords.reduce([]) { |squares, coord| squares << Square.new(coord) }
  end
end
