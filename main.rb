# frozen_string_literal: true

require_relative 'lib/square'
require_relative 'lib/board'

COLS = (0..7).freeze

chess = Board.new

chess.visit_all

puts chess
