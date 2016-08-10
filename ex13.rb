first, second, third = ARGV

puts "Your first variable is: #{first}"
puts "Your second variable is: #{second}"
puts "Your third variable is: #{third}"

print "Wait, I need one more variable: "
# Had some issues with this line – gets didn't work on its own so I had to use $stdin
fourth = $stdin.gets.chomp
puts "Your fourth variable is: #{fourth}"
puts "Here's all your variables:"
puts first + second + third + fourth