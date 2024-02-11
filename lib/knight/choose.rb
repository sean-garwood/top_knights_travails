# frozen_string_literal: true

# choose next square
module Choose
  def closer?
    distance < target.distance
  end

  def more_neighbors?
    neighbors > target.neighbors
  end
end
