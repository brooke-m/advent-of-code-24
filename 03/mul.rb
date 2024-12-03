## put it in a string
# scan ()
# strip the punctuation and do maths
# win

input = IO.readlines("input.txt", chomp: true).join

mul_ops = input.scan(/mul\(\d+,\d+\)/)
product = 0

mul_ops.each do |m|
  op = m.gsub("mul(", "").gsub(")", "")
  l, r = op.split(",")
  product += (l.to_i * r.to_i)
end

puts product