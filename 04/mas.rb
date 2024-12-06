@grid = []
count = 0

IO.readlines("input.txt", chomp: true).each do |l|
  @grid << l.chars
end

def check_corners(x, y)
  return false if x < 1 || y < 1 || x >= @grid.size - 1 || y >= @grid[0].size - 1 

    tl = @grid[x - 1][y - 1]
    tr = @grid[x - 1][y + 1]
    bl = @grid[x + 1][y - 1]
    br = @grid[x + 1][y + 1]

    if tl == "M" && tr == "M"
      return true if bl == "S" && br == "S"
    elsif tl == "M" && tr == "S"
      return true if bl == "M" && br == "S"
    elsif tl == "S" && tr == "S"
      return true if bl == "M" && br == "M"
    elsif tl == "S" && tr == "M"
      return true if bl == "S" && br == "M"
    end

  false
end

@grid.each_with_index do |line, x|
  line.each_with_index do |char, y|
    next unless char == "A"

    if check_corners(x,y)
      count += 1
    end
  end
end

puts count
