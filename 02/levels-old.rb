###
# haha it turns out being lazy is not a good plan
###

input = IO.readlines("input.txt", chomp: true)

safe = []
inverts = []
static = []
jumps = []

input.each do |line|
  reports = line.split

  if reports[0] > reports[1]
    # descending
    unsafe = false

    reports.each_with_index do |_, i|
      next unless reports[i+1]
      l = reports[i].to_i
      r = reports[i+1].to_i

      if l == r 
        static << [reports]
        unsafe = true
      elsif r > l
        inverts << [reports]
        unsafe = true
      elsif (l - r) > 3
        jumps << [reports]
        unsafe = true
      end
    end

    safe << [reports] unless unsafe

  elsif reports [1] > reports[0]
    # ascending
    unsafe = false

    reports.each_with_index do |_, i|
      next unless reports[i+1]
      l = reports[i].to_i
      r = reports[i+1].to_i

      if l == r 
        static << [reports]
        unsafe = true
      elsif r < l
        inverts << [reports]
        unsafe = true
      elsif (r - l) > 3
        jumps << [reports]
        unsafe = true
      end
    end
    safe << [reports] unless unsafe
  else
    static << [reports]
  end
end

puts safe.length.to_s + " safe"
puts "---"
puts inverts.length.to_s + " inverts"
puts jumps.length.to_s + " jumps"
puts static.length.to_s + " no change"