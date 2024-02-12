# frozen_string_literal: true

# determine position relative to destination
module Position
  MAX_DISTANCE = 6
  MIN_DISTANCE = 0
  def next_to_target?
    moves.include?(target)
  end

  def target?
    self == target
  end
end
