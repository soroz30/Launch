require 'pry'

class Triplet
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def sum
    [@a, @b, @c].inject(:+)
  end

  def product
    [@a, @b, @c].inject(:*)
  end

  def pythagorean?
    @a**2 + @b**2 == @c**2
  end

  def self.where(min_factor: 1, max_factor: nil, sum: nil)
    me = (min_factor..max_factor).to_a.combination(3).select do |comb|
      triplet = Triplet.new(*comb)
      triplet.pythagorean? && (sum.nil? ? true : triplet.sum == sum)
    end.map { |i| Triplet.new(*i) }
  end
end