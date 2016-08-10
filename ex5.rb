name = 'Zed A. Shaw'
age = 35
height = 74 # inches
weight = 180 # lbs
 # feel like the strings below should be lowercase and then modified as needed, but whatevs
eyes = 'Blue'
teeth = 'White'
hair = 'Brown'

puts "Let's talk about #{name}."
puts "He's #{height} inches tall."
puts "That's about #{(height * 2.54).to_i} centimetres."
puts "He's #{weight} pounds heavy."
puts "That's about #{(weight * 0.453592).to_i} kilograms."
puts "Actually that's not too heavy."
puts "He's got #{eyes} eyes and #{hair} hair."
puts "His teeth are usually #{teeth} depending on the coffee."

puts "If I add #{age}, #{height} and #{weight}, I get #{age + height + weight}."