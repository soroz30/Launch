require 'pry'

class Clock
  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes  
  end

  def self.at(hour, minutes = 0)
    Clock.new(hour, minutes)
  end

  def to_s
    format("%02d:%02d", @hour, @minutes)
  end

  def +(number)
    change!(number)
  end

  def -(number)
    change!(number)
  end

  def ==(other)
    to_s == other.to_s
  end

  private

  def change!(minutes)
    @minutes += minutes % 60
    @hour += minutes / 60
    @hour %= 24
    self
  end
end