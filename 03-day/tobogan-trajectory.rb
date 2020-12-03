# frozen_string_literal: true

Slope = Struct.new(:right, :down, :x, :trees, keyword_init: true)

File.open('input.txt') do |f|
  lines = f.readlines.map(&:to_s)

  slopes = [
    Slope.new(right: 1, down: 1, x: 0, trees: 0),
    Slope.new(right: 3, down: 1, x: 0, trees: 0),
    Slope.new(right: 5, down: 1, x: 0, trees: 0),
    Slope.new(right: 7, down: 1, x: 0, trees: 0),
    Slope.new(right: 1, down: 2, x: 0, trees: 0)
  ]

  lines.each_with_index do |line, index|
    line.delete!("\n")

    slopes.each do |slope|
      next unless (index % slope.down).zero?

      slope.trees += 1 if line[slope.x] == '#'

      slope.x += slope.right
      slope.x %= line.length
    end
  end

  puts slopes.map(&:trees).reduce(1, &:*)
end
