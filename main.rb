# frozen_string_literal: true

require 'set'

require_relative 'lib/coords'

require_relative 'lib/square'
require_relative 'lib/knight'

coord = -> { rand(0..7) }
t_coords = -> { [coord.call, coord.call] }
cycles = 30

cycles.times do
  puts KnightMoves.new(t_coords.call, t_coords.call)
end
