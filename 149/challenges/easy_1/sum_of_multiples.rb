class SumOfMultiples
  DEFAULT_ARGS = [3, 5]

  def initialize(*args)
    @custom_args = args
  end

  def self.to(limit, multiples = DEFAULT_ARGS)
    @@multiply_numbers = multiples
    (1...limit).inject(0) { |sum, i| multiply?(i) ? sum += i : sum }
  end

  def self.multiply?(number)
    @@multiply_numbers.any? { |i| (number % i).zero? }
  end

  def to(limit)
    self.class.to(limit, @custom_args)
  end
end