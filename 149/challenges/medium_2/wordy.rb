require 'pry'

class WordProblem
  REGEX_PATTERN = /-?\d+ ([a-z]+\s?(by)?) -?\d+( ([a-z]+\s?(by)?) -?\d+)*/
  OPERATIONS = {
    'plus' => '+',
    'minus' => '-',
    'multiplied' => '*',
    'divided' => '/'
  }

  def initialize(string)
    @array_of_operations = create_array_of_operations(string)
  end

  def create_array_of_operations(string)
    matched_words = string.match(REGEX_PATTERN)
    fail(ArgumentError) if matched_words.nil?
    matched_words[0].delete('by').split.map { |w| w.match(/^-?\d+$/) ? w.to_i : w }
  end

  def answer
    result = @array_of_operations.shift
    @array_of_operations.each_slice(2) do |operation|
      result = result.send(OPERATIONS[operation[0]], operation[1])
    end
    result
  end
end