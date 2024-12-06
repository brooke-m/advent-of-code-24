
@rules = {} # k, v[]
@updates = []
@good_updates = []
@bad_updates = []

def update_rules(rule)
  l, r = rule.split("|")
  if @rules[l]
    @rules[l] << r
  else
    @rules[l] = [r]
  end
end

def valid_pair?(x, y)
  @rules[x] && @rules[x].include?(y)
end

IO.readlines("input.txt", chomp: true).each do |l|
  update_rules(l) if l.match(/(\d*\|\d*)/)
  @updates << l if l.match(/(\d*,\d*)\d/)
end

@updates.each do |update|
  pages = update.split(",")
  valid = true
  
  pages.each_with_index do |p, i|
    pages[(i+1..-1)].all? do |n|
      valid = false unless valid_pair?(p,n)
    end
  end

  valid ? @good_updates << pages : @bad_updates << pages
end

### silly zone 


def fix(arr)
  out = []

  while arr.length > 0
    left = find_left(arr)
    out << left 
    arr = arr - [left]
  end
  out
end

def find_left(arr)
  return arr[0] if arr.length == 1

  x = 0

  arr.each do |i|
    tmp = arr - [i]

    return i if tmp.all?{ |n| @rules[i] && @rules[i].include?(n) }
  end
end

@better = []

@bad_updates.each do |bad|
  @better << fix(bad)
end

puts @better.map {|u| u[(u.length - 1)/2].to_i }.sum