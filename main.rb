#!/usr/local/bin/ruby

require 'text'

STDIN.readlines.each_slice(2) do |a, b|
  pairs = [[@last || '', a], [a, b]]

  pairs.each do |x, y|
    distance = Text::Levenshtein.distance(x, y)
    puts distance
    puts [x, y].join if distance < 10
    @last = b
  end
end
