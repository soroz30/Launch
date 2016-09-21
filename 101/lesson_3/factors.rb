def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  p divisors
end

factors(9)
factors(100)
factors(1)
factors(0)
factors(-3)