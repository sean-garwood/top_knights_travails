# frozen_string_literal: true

require_relative 'lib/bst'
require_relative 'lib/square'

a1 = Square.new(0, 0)
h8 = Square.new(7, 7)
d5 = Square.new(3, 4)

puts "distance from a1-h8 should be 7*2**0.5 ~~> 9.87: #{a1.distance_to(h8)}"
puts "agnostic? #{a1.distance_to(h8) == h8.distance_to(a1)}"
puts "distance from a1-d5 should be 7: #{a1.distance_to(d5)}"
