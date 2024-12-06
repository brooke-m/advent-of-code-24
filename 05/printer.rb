
@rules = {} # k, v[]
@updates = []
@good_updates = []

def update_rules(rule)
  l, r = rule.split("|")
  if @rules[l]
    @rules[l] << r
  else
    @rules[l] = [r]
  end
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
      valid = false unless @rules[p] && @rules[p].include?(n)
    end
  end

  @good_updates << pages if valid
end

puts @good_updates.map {|u| u[(u.length - 1)/2].to_i }.sum

