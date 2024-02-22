# frozen_string_literal: true

require_relative 'knight/output'

# shortest path between origin and destination
class KnightMoves
  include Coordinates
  include Output
  attr_accessor :origin, :destination, :unvisited_coords, :visited, :path, :number_of_moves

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
    @unvisited_coords = playing_area.to_set
    @visited = Set.new
    visit
    @path = find_path
    @number_of_moves = @path.size - 1
  end

  private

  def make_square(coords, dist)
    @unvisited_coords.delete(coords)
    Square.new(self, coords, dist)
  end

  def visit(curr = make_square(@origin, MIN_DISTANCE), queue = []) # rubocop:disable Metrics/AbcSize
    return if @origin == @destination

    if curr.unvisited_neighbors.include?(@destination)
      return visited.merge(
        [curr, make_square(@destination, curr.distance + 1)]
      )
    end

    visited.add(curr)
    curr.unvisited_neighbors.each { |n| queue << make_square(n, curr.distance + 1) }
    visit(queue.shift, queue)
  end

  def find_path(curr = square_at(@destination), t_path = [@destination])
    return [@origin, @destination] if @origin == @destination

    neighbor = visited.find do |s|
      s.valid.include?(curr.coordinates) && s.distance == curr.distance - 1
    end
    t_path.unshift(neighbor.coordinates)
    return t_path if t_path.include?(@origin)

    curr = neighbor
    find_path(curr, t_path)
  end
end
