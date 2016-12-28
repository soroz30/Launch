module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  attr_accessor :name
  include Walkable

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

sparky = Cat.new("Sophie")
sparky.greet
sparky.name = "Luna"
sparky.greet
sparky.walk