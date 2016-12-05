class Sieve
  def initialize(number)
    raise ArgumentError, 'Please use only positive integers' if verify(number)
    @prime_limit = number.even? ? number - 1 : number
    @prime_list = number < 2 ? [] : [2]
    calculate_primes
  end

  def verify(number)
    number.to_s.match(/^[1-9]\d+$/)
  end

  def list_include_multiply?(number)
    @prime_list.find { |i| (number % i).zero? }
  end

  def calculate_primes
    (3..@prime_limit).step(2).each do |i|
      @prime_list << i unless list_include_multiply?(i)
    end
  end

  def primes
    @prime_list
  end
end

puts Sieve.new(9).primes