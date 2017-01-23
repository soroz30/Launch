require 'pry'

class OCR
  NUMBERS = {
    " _\n| |\n|_|\n" => '0',
    "\n  |\n  |\n" => '1',
    " _\n _|\n|_\n" => '2',
    " _\n _|\n _|\n" => '3',
    "\n|_|\n  |\n" => '4',
    " _\n|_\n _|\n" => '5',
    " _\n|_\n|_|\n" => '6',
    " _\n  |\n  |\n" => '7',
    " _\n|_|\n|_|\n" => '8',
    " _\n|_|\n _|\n" => '9'
  }
  
  def initialize(text)
    @text = text
  end

  def convert
    return check_for_numbers(@text) if one_digit?
    cut_text
    format_text
    join_text
    create_final_string
  end

  private

  def check_if_number_is_correct(number)
    number.nil? ? "?" : number
  end

  def check_for_numbers(sign)
    number = NUMBERS.select { |k,_| k == sign }.values[0]
    check_if_number_is_correct(number)
  end

  def one_digit?
    @text.split(/\n/)[0].length <= 3
  end

  def cut_text
    @text = @text.split("\n")
  end

  def format_text
    @text.map! { |t| t.chars.each_slice(3).map { |i| i.join.sub(/ *$/, "\n") }}
  end

  def join_text
    @text = (0..(@text.length-3)).step(4).map { |i| create_number(@text[i..i+2]) }
  end

  def create_number(text)
    (0..text[0].length-1).map {|i| text.map {|j| j[i]}.join }
  end

  def create_array_of_numbers
    @text = @text.flat_map { |x| [x, "," ]}.flatten
  end

  def create_final_string
    create_array_of_numbers
    @text.map do |ele|
      number = check_for_numbers(ele)
      ele.eql?(',') ? ele : check_if_number_is_correct(number)
    end.join.chop
  end
end