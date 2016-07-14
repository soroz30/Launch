module Towable
  attr_accessor :year, :color, :model, :speed

  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle

  @@number = 0

  def initialize(year, color, model, speed=0)
    @@number += 1
    self.year = year
    self.color = color
    self.model = model
    self.speed = speed
  end

   def speed_up(speed)
    @speed += speed
  end

  def brake(speed)
    @speed -= speed
  end

  def shut_off
    @speed = 0
  end

  def car_color
    color
  end

  def change_color(color)
    self.color = color
  end

  def to_s
    "It's #{year} car, #{model} #{color} color, with the maximum speed of #{speed} "
  end

  def age
    "Your #{self.model} is #{years_old} years_old"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def self.inherit_number
    puts @@number
  end

  private

  def calculate_age
    Time.new.year - year
  end

end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  @@mileage = 0

end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2
end

p MyCar.ancestors
p MyTruck.ancestors
p Vehicle.ancestors