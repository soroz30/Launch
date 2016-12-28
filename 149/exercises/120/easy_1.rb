class Vehicle
  attr_reader :make, :model
  def initialize(make, model)
    @make = make
    @model = model    
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  attr_reader :make, :model

  def wheels
    4
  end
end

class Motorcycle < Vehicle
  attr_reader :make, :model

  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :make, :model, :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end




# class Pet
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# class Cat < Pet
#   def initialize(name, age, fur)
#     super(name, age)
#     @fur = fur
#   end

#   def to_s
#     "My cat #{@name} is #{@age} years old and has #{@fur} fur."
#   end
# end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch




# class Rectangle
#   def initialize(height, width)
#     @height = height
#     @width = width
#   end

#   def area
#     @height * @width
#   end
# end

# square = Square.new(5)
# puts "area of square = #{square.area}"

# class Square < Rectangle
#   def initialize(side)
#     super(side, side)
#   end
# end




# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     total = mileage + miles
#     @mileage = total
#   end

#   def print_mileage
#     puts mileage
#   end
# end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678




# class Flight
#   def initialize(flight_number)
#     @database_handle = Database.init
#     @flight_number = flight_number
#   end
# end




# class Person
#   def initialize(first_name, last_name)
#     @first_name = first_name.capitalize
#     @last_name = last_name.capitalize
#   end

#   def to_s
#     "#{@first_name} #{@last_name}"
#   end

#   def first_name= (value)
#     @first_name = value.capitalize
#   end

#   def last_name= (value)
#     @last_name = value.capitalize
#   end
# end

# person = Person.new('john', 'doe')
# puts person

# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person




# class Book
#   attr_accessor :title, :author
#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new
# book.author = "Neil Stephenson"
# book.title = "Snow Crash"
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)




# class Book
#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   def to_s
#     %("#{title}", by #{author})
#   end

#   def title
#     @title
#   end

#   def author
#     @author
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)



# class Book
#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)



# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#   end

#   def to_s
#     "My name is #{@name.upcase}."
#   end
# end

# name = 42
# fluffy = Pet.new(name)
# name += 1
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name




# class Banner
#   def initialize(message, length)
#     @message = message
#     @length = calculate_length(length)
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def calculate_length(length)
#     message_length = @message.length
#     lower_limit, higher_limit = (message_length + 2), (message_length + 10)
#     return length if (lower_limit)..(higher_limit).cover? length
#     length < lower_limit ? lower_limit : higher_limit
#   end

#   def horizontal_rule
#     "+#{'-' * (@length)}+"
#   end

#   def empty_line
#     "|#{' ' * (@length)}|"
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# banner = Banner.new('oses.', 2)
# puts banner