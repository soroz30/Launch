class Series
  def initialize(string_number)
    @numbers = string_number.chars.map(&:to_i)
  end

  def slices(slice)
    raise ArgumentError if slice > @numbers.length
    (0..@numbers.length-slice).map.with_index do |i, index|
      @numbers[i...i+slice]
    end
  end
end

###########

class Series
  attr_reader :numbers

  def initialize(string)
    @numbers = string.each_char.map(&:to_i)
  end

  def slices(count)
    fail ArgumentError.new("Slice is longer than input.")
    numbers.each_cons(count).to_a
  end
end