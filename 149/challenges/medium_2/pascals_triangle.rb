require 'pry'

class Triangle
  def initialize(number_of_rows)
    @number_of_rows = number_of_rows
  end

  def rows
    (1...@number_of_rows).each_with_object([[1]]) do |i, arr|
      arr << (0..i).map do |j|
        j.zero? ? first = 0 : first = arr[i-1][j-1].nil? ? 0 : arr[i-1][j-1]
        second = arr[i-1][j].nil? ? 0 : arr[i-1][j]
        first + second
      end
    end
  end
end