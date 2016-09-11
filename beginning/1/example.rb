require_relative 'bookstore'

#Method invocation
puts("hello")


#lots of code

str = 'a string'

def str
  "a method"
end
#wywola local variable
p str
#wywola metode
p str()
#dobrze pokazuje co chcemy
p(str())


class Person
  attr_accessor :name
end

bob = Person.new
#method is =
bob.name=('bob')

p bob.name


p ( bob.>(jim) )


#Standard library trzeba require dac

str = "hello"

loop do
  str = "world"
  breal
end

puts str