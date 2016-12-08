class Fixnum
  ROMAN_NUMERALS = %w(I V X L C D M)

  def to_roman
    reversed_number_array = self.to_s.reverse.split('')
    roman_number = ''
    reversed_number_array.each.with_index do |digit, index| 
      roman_number.prepend(create_roman_number(digit, index))
    end
    roman_number
  end

  private

  def create_roman_number(digit, index)
    index_for_roman_numerals = index + index + 1 
    roman_numerals_rules(digit, index_for_roman_numerals)
  end

  def roman_numerals_rules(digit, index)
    case digit.to_i
    when 0 then ''
    when 1 then ROMAN_NUMERALS[index-1]
    when 2 then ROMAN_NUMERALS[index-1]*2
    when 3 then ROMAN_NUMERALS[index-1]*3
    when 4 then ROMAN_NUMERALS[index-1] + ROMAN_NUMERALS[index]
    when 5 then ROMAN_NUMERALS[index]
    when 6 then ROMAN_NUMERALS[index] + ROMAN_NUMERALS[index-1]
    when 7 then ROMAN_NUMERALS[index] + ROMAN_NUMERALS[index-1]*2
    when 8 then ROMAN_NUMERALS[index] + ROMAN_NUMERALS[index-1]*3
    when 9 then ROMAN_NUMERALS[index-1] + ROMAN_NUMERALS[index+1]
    end
  end
end