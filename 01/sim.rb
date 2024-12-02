## plan
# line array 2 redux the cool-ening 2 furious and knuckles
# ???
# go back to tasks for real

left_input = []
right_input = []
similarity = 0;

input_lines = IO.readlines("input.txt", chomp: true)

input_lines.each do |v|
  l, r = v.split()
  left_input << l
  right_input << r
end

left_input.each do |v|
  similarity += (v.to_i * right_input.count(v))
end

puts similarity