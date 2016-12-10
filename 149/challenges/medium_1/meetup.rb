require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, named)
    @weekday = weekday
    self.send(named)
  end

  private

  def correct_date?(day)
    Date.new(@year, @month, day).send(@weekday.to_s+"?")
  end

  def teenth
    (13..19).each do |day|
      return Date.new(@year, @month, day) if correct_date?(day)
    end
  end

  def first
    (1..7).each do |day|
      return Date.new(@year, @month, day) if correct_date?(day)
    end
  end

  def second
    (8..14).each do |day|
      return Date.new(@year, @month, day) if correct_date?(day)
    end
  end

  def third
    (15..21).each do |day|
      return Date.new(@year, @month, day) if correct_date?(day)
    end
  end

  def fourth
    (22..28).each do |day|
      return Date.new(@year, @month, day) if correct_date?(day)
    end
  end

  def last
    -1.downto(-7).each do |day|
      return Date.new(@year, @month, day) if correct_date?(day)
    end
  end
end