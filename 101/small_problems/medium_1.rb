require 'pry'

def last_digit(nth)
  endings = 0.upto(60).map { |num| fibonacci_last(num)}
  endings[nth % 60]
end

def fibonacci_last(nth)
  fibonacci(nth).to_s[-1].to_i
end

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

p fibonacci(41)

# def fibonacci(number)
#   i = 1
#   sum = 0

#   1.upto(number) do
#     new_sum = i + sum
#     i = sum
#     sum = new_sum
#   end
#   p sum
# end

# fibonacci(100_001)



# def fibonacci(number)
#   return 1 if number <= 2
#   fibonacci(number-1) + fibonacci(number-2)
# end

# p fibonacci(20)




# DIGIT_HASH = {
#   'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
#   'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
# }.freeze

# def word_to_digit(words)
#   DIGIT_HASH.keys.each do |word|
#     words.gsub!(/#{word}\s|#{word}\b/, DIGIT_HASH[word])
#   end
#   words.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
# end

# p word_to_digit('Please call me at five five five one six two two two three three four. Thanks.')


# DIGITS = %w(one two three four five six seven eight nine)

# def word_to_digit(string)
#   string.split.map {|s| DIGITS.include?(s.match(/^\w+/)[0]) ? DIGITS.index(s.match(/^\w+/)[0])+1 : s}.join(' ')
# end

# p word_to_digit('Please call me at five five five one two three four. Thanks.')




# def minilang(commands)
#   register    = 0
#   stack       = []
#   conversions = { 'ADD'  => '+',
#                   'SUB'  => '-',
#                   'MULT' => '*',
#                   'DIV'  => '/',
#                   'MOD'  => '%' }
# #
#   commands.split.each do |command|
#     if number? command
#       register = command.to_i
#     elsif  command == 'PUSH'
#       stack << register
#     elsif command == 'POP'
#       register = stack.pop
#     elsif command == 'PRINT'
#       puts register
#     else
#       register = register.send(conversions[command], stack.pop)
#       #WAZNE tak sie wywoluje metody na czyms z nazwy!
#     end
#   end
# end

# def number?(command)
#   command.to_i.to_s == command
# end






# def minilang(order)
#   register = 0
#   stack = []
#   order.split.each do |ord|
#     if ord.match(/\d+/)
#       register = ord.to_i
#     else
#       case ord
#         when 'PUSH' then stack.push(register)
#         when 'ADD' then register = register + stack.pop
#         when 'SUB' then register = register - stack.pop
#         when 'MULT' then register = register * stack.pop
#         when 'DIV' then register = register / stack.pop
#         when 'MOD' then register = register % stack.pop
#         when 'POP' then register = stack.pop
#         when 'PRINT' then p register, stack
#         else 
#           return puts "Ivalid token #{ord}! "
#       end
#     end
#   end
# end

# minilang('dsas ')


# def further_diamond(size)
#   puts '*'.center(size)
#   (1...size-2).step(2) {|n| puts "*#{" " * n}*".center(size)}

#   ((-size+2)..-1).step(2) {|n| puts "*#{" " * -n}*".center(size)}
#   puts '*'.center(size)
# end


# further_diamond(11)





# def diamond(size)
#   (1...size).step(2) { |n| puts ('*' * n).center(size) }

#   (-size..-1).step(2) { |n| puts ('*' * -n).center(size) }
# end



# def print_row(grid_size, distance_from_center)
#   number_of_stars = grid_size - 2 * distance_from_center
#   stars = '*' * number_of_stars
#   puts stars.center(grid_size)
# end

# def diamond(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(0) { |distance| print_row(grid_size, distance) }
#   1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
# end





# def diamond(number)
#   1.upto(number) do |i|
#     if i <= number/2+1
#       puts "#{" " * ((number - (i*2-1))/2)}#{"*" * (i*2-1)}"
#     else
#       puts "#{" " * ((number - ((number-i)*2+1))/2)}#{"*" * ((number-i)*2+1)}"
#     end
#   end
# end

# diamond(9)



# def lights_switch
#   ary = Array.new(1000, 0)
#   1.upto(1000) do |i|
#     ary = ary.map.with_index do |el, index|
#       if (index + 1) % i == 0
#         el == 0 ? 1 : 0
#       else
#         el
#       end
#     end
#   end
#   ary.each_with_index {|i, index| p index+1 if i == 1}
# end

# p lights_switch



# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

# def rotate_rightmost_digits(number, n)
#   all_digits = number.to_s.chars
#   all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
#   all_digits.join.to_i
# end

# def rotate_rightmost_digits(number, rotate)
#   split_number = number.to_s.split('') 
#   end_index = split_number.length-1
#   first_part = split_number[0, end_index-rotate+1]
#   second_part = rotate_array(split_number[end_index-rotate+1, rotate])
#   (first_part + second_part).join.to_i
# end

# def max_rotation(number)
#   number_digits = number.to_s.size
#   number_digits.downto(2) do |i|
#     number = rotate_rightmost_digits(number,i)
#   end
#   number
# end

# p max_rotation(105)
# p max_rotation(8_703_529_146) == 7_321_609_845

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15
# p rotate_rightmost_digits(735291, 6)

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915  
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917





# def rotate_array(array)
#   array_copy = array.dup
#   copy = array_copy[0]
#   array_copy.shift
#   array_copy.push(copy)
#   array_copy
# end


# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']