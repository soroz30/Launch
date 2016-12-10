class PhoneNumber
  INCORRECT_PATTER = /\d.*[a-z].*\d/i
  def initialize(text)
    @text = text
  end

  def number
    create_number
    return '0000000000' if @text =~ INCORRECT_PATTER || incorrect_number?
    @number
  end

  def area_code
    number[0..2]
  end

  def exchange
    number[3..5]
  end

  def sln
    number[6..9]
  end

  def to_s
    "(#{area_code}) #{exchange}-#{sln}"
  end

  private

  def create_number
    @number = @text.scan(/(\d)/).join
  end

  def incorrect_number?
    @number.length < 10 || 
      @number.length > 11 ||
      (@number.length == 11 && @number[0] != '1')
  end
end