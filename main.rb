# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/square'

COLS = (0..7).freeze

puts Board.new([0,0], [1,1])
