filename = ARGV.first

puts "We are going to erase #{filename}"
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

$stdin.gets

# This opens the file in write-only mode, which truncates existing file anyway or creates a new one
puts "Opening the file..."
target = open(filename, 'w')

puts "Truncating the file. Goodbye!"
target.truncate(0)

puts "Now I'm going to ask you for three lines."

print "line 1: "
line1 = $stdin.gets.chomp
print "line 2: "
line2 = $stdin.gets.chomp
print "line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file."

# Study drill 3
target.write("#{line1}\n#{line2}\n#{line3}")

puts "And finally, we close it."
target.close

# Study drill 2
puts "Here's your new file:"

view_target = open(filename)
puts view_target.read
view_target.close