# load lines into map with index <i, v>
# sort into arrays
# ???
# go back to whatever i as meant to do instead of this

left_input = {}
right_input = {}

input_lines = b = IO.readlines("input.txt", chomp: true)

input_lines.each_with_index do |v, i|
  l, r = v.split()
  left_input[i.to_s.to_sym] = l
  right_input[i.to_s.to_sym] = r
end

left_list = left_input.sort_by {|k, v| v}
right_list = right_input.sort_by {|k, v| v}
difference_sum = 0

left_list.each_with_index do |l_pair, i|
  r_pair = right_list[i]
  difference_sum += (l_pair[1].to_i - r_pair[1].to_i).abs
end

puts difference_sum