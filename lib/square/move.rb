# frozen_string_literal: true

# move about the board
module Move
  COLS = (0..7).freeze
  CENTER_COLS = (2..5).freeze
  SHIFTS = [[2, 1], [1, 2]].freeze
  # possible moves:
  #   [x + 2, y + 1]
  #   [x + 2, y - 1]
  #   [x - 2, y + 1]
  #   [x - 2, y - 1]
  #   [x + 1, y + 2]
  #   [x + 1, y - 2]
  #   [x - 1, y + 2]
  #   [x - 1, y - 2]
  #   only really care about the two that go toward the target
  #     target is a 2 is a special case--need to get to a six then

  # two ways to weigh candidate moves:
  #   reduce distance between pos and target
  #   goto most connections unless target == 2, then prefer 6 in same quad

  def distance_to(dest)
    (x - dest.x).abs + (y - dest.y).abs
  end

  def legal?
    !(COLS.include?(x) && COLS.include?(y))
  end

  def out_of_bounds?(coord)
    COLS.include?(coord)
  end
end
