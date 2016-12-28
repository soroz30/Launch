class Person
  attr_writer :secret

  def compare_secret(other_person)
    secret == other_person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

person1.compare_secret(person2)


# class Cat
#   COLOR = "purple"
#   attr_accessor :name
#   @@cats_total = 0

#   def initialize(name="Sophie")
#     @name = name
#     @@cats_total += 1
#   end

#   def self.generic_greeting
#     puts "Hello, I'm a cat!"
#   end

#   def self.total
#     puts @@cats_total
#   end

#   def personal_greeting
#     puts "Hello!, My name is #{name} and I'm a #{COLOR} cat!"
#   end

#   def rename(name)
#     self.name = name
#   end

#   def identify
#     self
#   end

#   def to_s
#     "I'm #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# puts kitty