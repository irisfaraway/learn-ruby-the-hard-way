def do_number_stuff(top, interval)
  i = 0
  numbers = []

  while i < top
    puts "At the top i is #{i}"
    numbers.push(i)

    i += interval
    puts 'numbers now: ', numbers
    puts "At the bottom i is #{i}"
  end

  puts 'The numbers: '

  # remember you can write this 2 other ways?
  numbers.each { |num| puts num }
end

# awful copy ahoy!
print 'How high do you want to count? '
top = gets.chomp.to_i

print 'And what interval do you want to count by? '
interval = gets.chomp.to_i

do_number_stuff(top, interval)
