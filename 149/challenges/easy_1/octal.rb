class Octal
  def initialize(octal)
    @octal = octal.match(/[8-9]|[a-z]/i) ? '0' : octal
    @length = @octal.length
  end

  def to_decimal
    (0...@length).inject(0) { |sum, i| sum += @octal.reverse[i].to_i * 8 ** i }
  end
end