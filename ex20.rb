# Gets first argument and turns them into this variable
input_file = ARGV.first

# Prints the full contents of whatever file it's given
def print_all(f)
  puts f.read
end

# Goes back to the start of whatever file it's given
def rewind(f)
  f.seek(0)
end

# Prints the current line of the file, prefaced by a count
# I don't think the count actually relates to the file, although they should be in sync
def print_a_line(line_count, f)
  puts "#{line_count}, #{f.gets.chomp}"
end

# Opens the input file
current_file = open(input_file)

puts "First let's print the whole file:\n"

print_all(current_file)

puts "Now let's rewind, kind of like a tape."

rewind(current_file)

puts "Let's print three lines:"

# Sets the current line count, prints the first line
# But it only prints the first line because we've rewound, not because of what current_line is set to
current_line = 1
print_a_line(current_line, current_file)

current_line = current_line + 1
print_a_line(current_line, current_file)

current_line = current_line + 1
print_a_line(current_line, current_file)