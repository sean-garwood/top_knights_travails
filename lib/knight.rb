# frozen_string_literal: true

require_relative 'knight/output'

# shortest path between origin and destination
class KnightMoves
  include Coordinates
  include Debug
  include Output
  attr_accessor :origin, :destination, :unvisited_coords, :visited, :path

  def initialize(origin = K_POS, destination = T_POS)
    @origin = origin
    @destination = destination
    @unvisited_coords = playing_area.to_set
    @visited = Set.new
    visit
    @path = find_path
  end

  private

  def make_square(coords, dist)
    @unvisited_coords.delete(coords)
    Square.new(self, coords, dist)
  end

  def visit(curr = make_square(@origin, MIN_DISTANCE), queue = [])
    if curr.neighbors.empty? || curr.neighbors.include?(@destination)
      return visited.merge(
        [curr, make_square(@destination, curr.distance + 1)]
      )
    end

    visited.add(curr)
    curr.neighbors.each { |n| queue << make_square(n, curr.distance + 1) }
    visit(queue.shift, queue)
  end

  def find_path(
    curr = visited.find { |s| s.coordinates == @destination },
    t_path = [curr]
  )
    neighbor = visited.find do |s|
      s.valid.include?(curr.coordinates) && s.distance == curr.distance - 1
    end
    t_path.unshift(neighbor)
    return t_path if t_path.map(&:coordinates).include?(@origin)

    curr = neighbor
    find_path(curr, t_path)
  end
end
