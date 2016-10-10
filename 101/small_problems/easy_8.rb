require 'pry'


def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2] #WAZNE, mozna tak pobierac iles elementow od jakiegos punktu
  end
end




def center_of(string)
  length = string.length
  length.even? ? string[length/2-1..length/2] : string[length/2]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'



def num_to_arr(num)
  num_array = []
  loop do 
    num, remainder = num.divmod(10)
    num_array.unshift remainder
    break if num == 0
  end
  num_array
end

# array of num to actual num
def arr_to_num(arr)
  result_num = 0
  reversed_arr = arr.reverse
  reversed_arr.each_with_index do |num, index|
    result_num += num * (10 ** index)
  end
  result_num
end

def reversed_number(num)
  arr_of_numbers = num_to_arr(num)
  arr_to_num(arr_of_numbers.reverse)
end




# def reversed_number(number)
#   string = number.to_s
#   digits = string.chars
#   reversed_digits = digits.reverse
#   reversed_string = reversed_digits.join('')
#   reversed_string.to_i
# end


# def reversed_number(number)
#   number.to_s.reverse.to_i
# end

# p reversed_number(12345) == 54321
# p reversed_number(12213) == 31221
# p reversed_number(456) == 654
# p reversed_number(12000) == 21 # Note that zeros get dropped!
# p reversed_number(1) == 1


# def double_consonants(string)
#     string.gsub!(/[b-df-hj-np-tv-z]/i) {|char| char*2}
#     string
# end


# def double_consonants(string)
#   string.chars.map { |i| i.match(/[a-z&&[^aeiou]]/i) ? i * 2 : i }.join
# end

# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""

# def repeater(string)
#   string.chars.map { |i| i * 2 }.join
# end

# def repeater(string)
#   string.gsub(/(.)/, '\1\1')
# end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''


# def fizzbuzz(starting_number, ending_number)
#   result = []
#   starting_number.upto(ending_number) do |number|
#     result << fizzbuzz_value(number)
#   end
#   puts result.join(', ')
# end

# def fizzbuzz_value(number)
#   case 
#   when number % 3 == number % 5 == 0
#     'FizzBuzz'
#   when number % 5 == 0
#     'Buzz'
#   when number % 3 == 0
#     'Fizz'
#   else
#     number
#   end
# end





# def substrings_at_start(string)
#   string.chars.map.with_index { |i, index| string[0..index]}
# end

# # def substrings(str)
# #     result = []
# #     str.each_char {|c| result << substrings_at_start(str[str.index(c)..str.size])}
# #     result.flatten
# # end

# def substrings(string)
#   final_array = []
#   0.upto(string.length-1).each do |i| 
#     final_array << substrings_at_start(string[i..string.length-1])
#   end
#   final_array.flatten
# end

# # p substrings('abcde') == [
# #   'a', 'ab', 'abc', 'abcd', 'abcde', 
# #   'b', 'bc', 'bcd', 'bcde',
# #   'c', 'cd', 'cde',
# #   'd', 'de',
# #   'e'
# # ]

# def palindromes(string)
#   substrings = substrings(string)
#   substrings.select {|string| string.length > 1 && string == string.reverse}
# end

# p palindromes('hello-madam-did-madam-goodbye')

# def palindromic?(str, ignore_nonalphanumeric=true, ignore_case=true)
#   str = str.gsub(/\W/,'') if ignore_nonalphanumeric
#   str = str.downcase if ignore_case
#   str.length > 1 && str == str.reverse
# end

# def palindromes(str)
#   substrings(str).select { |substring| palindromic?(substring) }
# end

# substrings('abcde')

# p substrings_at_start('abc') == ['a', 'ab', 'abc']
# p substrings_at_start('a') == ['a']
# p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']



# puts "Enter a noun:"
# noun = gets.chomp

# puts "Enter a verb:"
# verb = gets.chomp

# puts "Enter an adjective:"
# adjective = gets.chomp

# puts "Enter an adverb"
# adverb = gets.chomp

# sequence = [noun, verb, adjective, adverb].shuffle

# puts "Do you #{sequence[0]} your #{sequence[1]} #{sequence[2]} #{sequence[3]}"


# def sum_of_sums(numbers)
#   sum_total = 0
#   1.upto(numbers.size) do |count|
#     sum_total += numbers.slice(0, count).reduce(:+)
#   end
#   sum_total
# end


# def sum_of_sums(array)
#   array.map.with_index { |i, index| array[0..index].inject(:+) }.inject(:+)
# end

# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35