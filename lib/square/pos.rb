# frozen_string_literal: true

# determine position relative to destination
module Position
  def find_quad
    return right_side? && 0 || 1 if top_half?

    left_side? && 2 || 3
  end

  def bottom_half?
    y <= 3
  end

  def top_half?
    !bottom_half?
  end

  def left_side?
    x <= 3
  end

  def right_side?
    !left_side?
  end

  def left_of?(dest)
    x < dest.x && !same_col?(dest)
  end

  def below?(dest)
    y < dest.y && !same_row?(dest)
  end

  def same_row?(dest)
    x == dest.x
  end

  def same_col?(dest)
    y == dest.y
  end

  def same_square?(dest)
    same_row?(dest) && same_col?(dest)
  end
end
