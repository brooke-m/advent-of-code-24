### plan
# ough,,
# big grid? 

@grid = []
count = 0

IO.readlines("input.txt", chomp: true).each do |l|
  @grid << l.chars
end

shifts = [[-1, -1], [0, -1], [1, -1], [-1, 0], [1, 0], [-1, 1], [0, 1], [1, 1]]

def get_tile(x,y)
  return nil if x < 0 || y < 0 || x >= @grid.size || y >= @grid[0].size

  @grid[x][y]
end

@grid.each_with_index do |line, x|
  line.each_with_index do |char, y|
    next unless char == "X"

    shifts.each do |i, j|
      mx, my = (x + i), (y + j)

      next unless get_tile(mx, my) == "M"

      ax, ay = (mx + i), (my + j)

      next unless get_tile(ax, ay) == "A"

      sx, sy = (ax + i), (ay + j)

      count += 1 if get_tile(sx, sy) == "S"
    end
  end
end

puts count