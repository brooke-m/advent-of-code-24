### 
# day 2 act 1
###

input = IO.readlines("input.txt", chomp: true)
safe_count = 0

def safe?(reports) # array -> int
  up = 0
  down = 0
  unsafe = false

  reports.each_with_index do |_, i|
    next unless reports[i + 1]
    delta = reports[i].to_i - reports[i + 1].to_i
    
    # puts reports[i] + " - " + reports[i + 1] + " = " + delta.to_s

    up += 1 if delta > 0
    down += 1 if delta < 0
    unsafe = true if delta == 0 || delta.abs > 3
  end

  return 0 if (up > 0 && down > 0) || unsafe
  1
end

input.each do |line|
  safe_count += safe?(line.split)
end

puts safe_count
