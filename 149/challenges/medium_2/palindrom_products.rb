require 'pry'

class Palindromes
  def initialize(max_factor:, min_factor: 1)
    @factors = factors(max_factor, min_factor)
  end

  def generate
    @factors.select! do |candidate|
      (candidate[0] * candidate[1]).to_s == (candidate[0] * candidate[1]).to_s.reverse
    end
    binding.pry
  end

  def largest
    max = @factors.map { |factor| factor[0] * factor[1] }.max
    factors = @factors.select { |factor| factor[0] * factor[1] == max }
    Palindrome.new(max, factors)
  end

  def smallest
    min = @factors.map { |factor| factor[0] * factor[1] }.min
    factors = @factors.select { |factor| factor[0] * factor[1] == min }
    Palindrome.new(min, factors)
  end

  private

  def factors(max, min)
    (min..max).to_a.combination(2).to_a + (min..max).to_a.map { |num| [num, num] }
  end
end

class Palindrome
  attr_reader :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end