# frozen_string_literal: true

# make a set of squares for the chessboard
module Empty
  def coordinates_of(piece)
    puts "enter the x coordinate of the #{piece}."
    x = gets.chomp.to_i
    puts "enter the y coordinate of the #{piece}."
    y = gets.chomp.to_i
    [x, y]
  end

  def coords
    result = []
    rows = COLS
    COLS.each do |col|
      rows.each do |row|
        result << [row, col]
      end
    end
    result
  end

  def make_board
    remaining_coords = coords.reject { |coord| coord == knight.coordinates }
    remaining_coords.map { |coord| Square.new(coord) }
  end
end
