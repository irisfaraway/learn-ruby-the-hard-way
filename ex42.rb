# Animal is-a object look at the extra credit
class Animal
end

# Dog is-a Animal
class Dog < Animal
  def initialize(name)
    # set the name attribute to the param provided
    @name = name
  end
end

# Cat is-a Animal
class Cat < Animal
  def initialize(name)
    # set the name attribute to the param provided
    @name = name
  end
end

# Person is-a object (disturbing)
class Person
  def initialize(name)
    # set the name attribute to the param provided
    @name = name

    # Person has-a pet of some kind
    @pet = nil
  end

  attr_accessor :pet
end

# Employee is-a Person (wise words)
class Employee < Person
  def initialize(name, salary)
    # super checks ancestor classes to inherit the name method
    super(name)
    # set the salary to the param provided
    @salary = salary
  end
end

# Fish is-a object
class Fish
end

# Salmon is-a Fish
class Salmon < Fish
end

# Halibut is-a Fish
class Halibut < Fish
end

# create a new Dog with the name 'Rover'
rover = Dog.new('Rover')

# create a new Cat with the name 'Satan'
satan = Cat.new('Satan')

# create a new Person with the name 'Mary'
mary = Person.new('Mary')

# set mary's pet to satan
mary.pet = satan

# create a new Employee with the name 'Frank' and a baller salary
frank = Employee.new('Frank', 120_000)

# set frank's pet to rover
frank.pet = rover

# create a new fish
flipper = Fish.new

# create a new salmon
crouse = Salmon.new

# create a new halibut
harry = Halibut.new
