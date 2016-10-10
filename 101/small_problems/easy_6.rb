require 'pry'


def triangle(number)
  (1..number).each {|n| puts "#{"*" * n}".rjust(number)} 
end

# def triangle(num)
#   spaces = num - 1
#   stars = 1

#   num.times do |n|
#     puts (' ' * spaces) + ('*' * stars)
#     spaces -= 1
#     stars += 1
#   end
# end


triangle(9)


# def include?(array, value)
#   array.each { |element| return true if value == element }
#   false
# end


# def include?(array, value)
#   !!array.find_index(value)
# end


# def include?(array, element)
#   array.index(element) ? true : false
# end

# p include?([1,2,3,4,5], 3) == true


# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false


# def find_dup(arr)
#   loop do
#     el = arr.shift

#     break el if arr.index(el)
#   end
# end

# def find_dup(array)
#   array.find {|i| array.count(i) > 1}
# end

# def find_dup(arr)
#   result = arr.chunk { |n| arr.count(n) }.select { |freq, num| num if freq == 2 }
#   result.flatten!.uniq![1]
# end

# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73



# def halvsies(array)
#   first_half = array.slice(0, (array.size / 2.0).ceil)
#   second_half = array.slice(first_half.size, array.size - first_half.size)
#   [first_half, second_half]
# end

# def halvsies(arr)
#   half = (arr.length / 2.0).round
#   [arr.take(half), arr.drop(half)]
# end

# def halvsies(arr)
#   [arr[0...(arr.length/2+arr.length%2)], arr[(arr.length/2+arr.length%2)..-1]]
# end

# p halvsies([1, 2, 3, 4])
# p halvsies([1, 5, 2, 4, 3])

# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]


# def reverse(arr)
#   arr.reduce([]) { |result, el| result.unshift el}
# end

# def reverse(arr)
#   arr.each_with_object([]) { |el, result| result.unshift el}
# end

# def reverse(array)                                                                                                                                                      
#   1.upto(array.length).map { |index| array[-index] }                                                                                                                    
# end

# def reverse(array)
#   result_array = []
#   array.reverse_each { |element| result_array << element }
#   result_array
# end

# def reverse(array)
#   array.map.with_index {|i, index| array[(array.length-1)-index]}
# end

# p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true
# list = [1, 2, 3]                      # => [1, 2, 3]
# new_list = reverse(list)              # => [3, 2, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 2, 3]                     # => true
# p new_list == [3, 2, 1]   

# def reverse!(list)
#     num = list.size - 1
#     copy = list.dup #MEGA WAZNE, duplikat!

#     result = list.each_index { |i| list[i] = copy[num - i] }
# end




# def reverse!(array)
#   (0..array.length-1).each do |i|
#     copy = array.first
#     array.shift
#     array.insert(array.length-i, copy)
#   end
#   array
# end

# list = [1,2,3,4]
# result = reverse!(list) # => [4,3,2,1]
# p list == [4, 3, 2, 1]
# p list.object_id == result.object_id

# list = %w(a b c d e)
# reverse!(list) # => ["e", "d", "c", "b", "a"]
# p list == ["e", "d", "c", "b", "a"]

# list = ['abc']
# reverse!(list) # => ["abc"]
# p list == ["abc"]

# list = []
# reverse!([]) # => []
# p list == []

# def find_fibonacci_index_by_length(number_digits)
#   first = 1
#   second = 1
#   index = 2

#   loop do
#     index += 1
#     fibonacci = first + second
#     break if fibonacci.to_s.size >= number_digits

#     first = second
#     second = fibonacci
#   end

#   index
# end

# def fibonacci(number)
#   if number < 2
#     number
#   else
#     fibonacci(number - 1) + fibonacci(number - 2)
#   end
# end



# p find_fibonacci_index_by_length(100)



# def remove_vowels(array)
#   array.map { |chars| chars.scan(/[^aeiou]/i).join }
# end



# def remove_vowels(array)
#   array = array.map { |string| string.delete 'aeiouAEIOU'}
# end

# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']



# DEGREE = "\xC2\xB0"
# MINUTES_PER_DEGREE = 60
# SECONDS_PER_MINUTE = 60
# SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

# def dms(degrees_float)
#   total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
#   degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
#   minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
#   format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
# end



# def dms(degree)
#   degrees = degree.to_s.match(/^\d+/)
#   minutes = degree.to_s.match(/\.(\d+)/)[1].prepend('0.').to_f*60
#   seconds =  minutes.to_s.match(/\.(\d+)/)[1].prepend('0.').to_f*60
#   "#{degrees}°#{minutes.ceil}\'#{seconds.ceil}\""
# end

# p dms(93.034773)