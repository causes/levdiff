#!/usr/local/bin/ruby

require 'text'

# threshold Levenshtein edit distance to suppress output
# will only output the lines if distance < threshold
threshold = ENV['THRESHOLD'].to_i || 10

STDIN.readlines.each_slice(2) do |a, b|
  pairs = [[@last || '', a], [a, b]]

  pairs.each do |x, y|
    distance = Text::Levenshtein.distance(x, y)
    puts [x, y].join if distance < threshold
    @last = b
  end
end
