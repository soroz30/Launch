class Trinary
  INVALID_TRINARY = /\D|[3-9]/
  BASE = 3

  attr_reader :trinary_string

  def initialize(trinary_string)
    @trinary_string = trinary_string
  end

  def to_decimal
    trinary_string =~ INVALID_TRINARY ? 0 : calculate
  end

  private

  def calculate
    limit = trinary_string.length
    reversed = trinary_string.reverse
    (0...limit).inject(0) { |sum, i| sum += reversed[i].to_i * (BASE ** i) }
  end
end