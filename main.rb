#!/usr/local/bin/ruby

require 'text'

STDIN.readlines.each_slice(2) do |a, b|
  distance = Text::Levenshtein.distance(a, b)
  puts distance
  puts [a, b].join if distance < 10
end
