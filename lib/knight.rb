# frozen_string_literal: true

require_relative 'knight/output'

# shortest path between origin and destination
class KnightMoves
  include Coordinates
  include Debug
  include Output
  attr_accessor :origin, :destination, :unvisited_coords, :visited
  attr_reader :knight_moves

  def initialize(origin = K_POS, destination = T_POS)
    @origin = origin
    @destination = destination
    @unvisited_coords = playing_area
    @visited = []
    visit
    @knight_moves = find_path
  end

  private

  def visit(coords = @origin, queue = [], depth = 0)
    square = Square.new(@unvisited_coords.delete(coords), depth)
    @visited << square
    adj = square.neighboring_coords
    return @visited << Square.new(@destination, depth + 1) if adj.include?(@destination)

    to_queue = adj.select { |c| unvisited_coords.include?(c) }
    to_queue.each { |n| queue << n }
    return @visited if queue.empty? || unvisited_coords.empty?

    depth += 1
    visit(queue.shift, queue, depth)
  end

  def find_path(curr = @visited.pop, path = [curr])
    next_one = @visited.select do |s|
      s.neighboring_coords.include?(curr.coordinates) && s.distance == curr.distance - 1
    end.first
    path << next_one
    return path if path.map(&:coordinates).include?(@origin)

    find_path(next_one, path)
  end
end
