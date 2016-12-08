require 'prime'

class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0
    return 'deficient' if Prime.prime?(number)
    number_category(number)
  end

  private

  def self.number_category(number)
    ['perfect', 'deficient', 'abundant'][number <=> sum_of_divisors(number)]
  end

  def self.sum_of_divisors(number)
    (1..number/2).inject { |sum, i| (number%i).zero? ? sum += i : sum }
  end
end