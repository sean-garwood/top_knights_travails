# frozen_string_literal: true

require 'set'

require_relative 'lib/coords'
require_relative 'lib/debug'

require_relative 'lib/square'
require_relative 'lib/knight'

# test_coords = -> { [rand(0..7), rand(0..7)] }
# cycles = 3

# cycles.times { puts KnightMoves.new(test_coords.call, test_coords.call) }

puts KnightMoves.new
