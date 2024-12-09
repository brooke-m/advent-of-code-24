
def check(input, target, n, i)
  return unless input[i] != nil

  if i == (input.length - 1)
    @valid = true if (target == n + input[i]) || (target == n * input[i])
  end
  check(input, target, (n + input[i]), i + 1)
  check(input, target, (n * input[i]), i + 1)
end

result = 0

IO.readlines("input.txt", chomp: true).each do |line|
  target, _, input = line.partition(": ")
  values = input.split.map{ |n| n.to_i }

  @valid = false
  check(values, target.to_i, 0, 0)
  result += target.to_i if @valid
end

puts result