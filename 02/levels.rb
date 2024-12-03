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

    up += 1 if delta > 0
    down += 1 if delta < 0
    unsafe = true if delta == 0 || delta.abs > 3
  end

  return false if (up > 0 && down > 0) || unsafe
  true
end

def safe_ish?(reports)
  recoverable = false

  reports.each_with_index do |_,i|
    section = reports.dup.tap{|a| a.delete_at(i)}
    recoverable = true if safe?(section)
  end

  return recoverable
end

# lets gooooooo

input.each do |line|
  if safe?(line.split)
    safe_count += 1
  elsif safe_ish?(line.split)
    safe_count += 1 # close enough
  end
end

puts safe_count
