## put it in a string
# scan ()
# strip the punctuation and do maths
# win

input = IO.readlines("input.txt", chomp: true).join
product = 0
commands = {}


# index mul products by substring index
mul_pos = input.enum_for(:scan, /mul\(\d+,\d+\)/).map { [ Regexp.last_match.begin(0) ] }
products = []

input.scan(/mul\(\d+,\d+\)/).each do |m|
  op = m.gsub("mul(", "").gsub(")", "")
  l, r = op.split(",")
  products << (l.to_i * r.to_i)
end

mul_pos.flatten.zip(products).each do |p|
  commands[p[0]] = p[1]
end

# index do commands
input.enum_for(:scan, /do\(\)/).map { [ Regexp.last_match.begin(0) ] }.flatten.each do |d|
  commands[d] = "DO"
end

# index don't commands
input.enum_for(:scan, /don't\(\)/).map { [ Regexp.last_match.begin(0) ] }.flatten.each do |d|
  commands[d] = "DON'T"
end

# do the thing:)

active_mul = true

commands.sort.each do |cmd|
  if cmd[1] == "DON'T"
    active_mul = false
  elsif cmd[1] == "DO"
    active_mul = true
  else 
    product += cmd[1].to_i if active_mul
  end
end

puts product