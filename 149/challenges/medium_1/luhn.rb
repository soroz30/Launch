class Luhn
  attr_accessor :digits

  def initialize(number)
    @digits = number.to_s.chars.map(&:to_i)
  end

  def addends
    @digits = @digits
              .reverse
              .map.with_index {|val,index| index.odd? ? val * 2 : val}
              .map!{|val| val >= 10 ? val - 9 : val}
              .reverse
  end

  def checksum(formula = true)
    addends if formula
    sum_digits
  end

  def valid?
    checksum.to_s[-1].to_i.zero?
  end

  def self.create(number)
    number = self.add_zero_to_number(number)
    @@test_number = Luhn.new(number)
    return number if @@test_number.valid?
    number += add_check_digit   
  end

  private

  def sum_digits
    digits.to_s.chars.map(&:to_i).inject(:+)
  end

  def self.add_zero_to_number(number)
    number * 10
  end

  def self.add_check_digit
    10 - @@test_number.checksum(false).to_s[-1].to_i
  end
end

luhn = Luhn.new(8_739_567)
p luhn.valid?