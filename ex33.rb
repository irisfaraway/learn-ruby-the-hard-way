def do_number_stuff(top)
  i = 0
  numbers = []

  while i < top
    puts "At the top i is #{i}"
    numbers.push(i)

    i += 1
    puts 'numbers now: ', numbers
    puts "At the bottom i is #{i}"
  end

  puts 'The numbers: '

  # remember you can write this 2 other ways?
  numbers.each { |num| puts num }
end

print 'How high do you want to count? '
do_number_stuff(gets.chomp.to_i)
