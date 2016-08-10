# gets argument
filename = ARGV.first

# create a file object
txt = open(filename)

# prints the contents of the file object
puts "Here's your file #{filename}:"
# I changed this to puts because I wanted to
puts txt.read

# close the file – note that you have to close the object
txt.close

# asks for another filename and turns that into a string
print "\nType the filename again: "
file_again = $stdin.gets.chomp

# creates a file object
txt_again = open(file_again)

# puts (chose to do this instead of prints) the contents of the file object
puts txt_again.read

# close the file object
txt_again.close