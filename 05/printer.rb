
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

IO.readlines("example.txt", chomp: true).each do |l|
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

puts @good_updates.map {|u| u[(u.length - 1)/2].to_i }.sum

