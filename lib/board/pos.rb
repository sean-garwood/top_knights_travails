# frozen_string_literal: true

# determine position relative to destination
module Position
  MIN_DISTANCE = 0
  def next_to_target?(square)
    square.moves.include?(target.coordinates)
  end

  def target?(square)
    square.coordinates == target.coordinates
  end
end
