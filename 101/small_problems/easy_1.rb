def calculate_bonus(number, bonus)
  bonus ? number/2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

# def sum(number)
#   number.to_s.split("").map(&:to_i).inject(:+)
# end

# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# def average(array)
#   array.inject(:+) / array.size.to_f
# end

# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# def stringy(number)
#   (1..number).map { |n| n % 2 == 0 ? 0 : 1}.join("")
# end

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# def stringy(size)
#   ('10' * size).slice(0, size)
# end

# def stringy(num)
#   Array(1..num).map! { |n| n % 2 }.join
# end

# def reverse_words(string)
#   string.split(" ").map {|s| s.length > 4 ? s.reverse : s }.join(" ")
# end

# puts reverse_words('Professional') 

# def reverse_sentence(string)
#   string.split.reverse.join(' ')
# end

# def count_occurrences(array)
#   puts array.uniq.map {|ele| "#{ele} => #{array.count(ele)}"}
# end

# vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

# count_occurrences(vehicles)

# def count_occurrences(array)
#   occurrences = {}

#   array.uniq.each do |element|
#     occurrences[element] = array.count(element)
#   end

#   occurrences.each do |element, count|
#     puts "#{element} => #{count}"
#   end
# end

# def digit_list(number)
#   digits = []
#   loop do
#     number, remainder = number.divmod(10)
#     digits.unshift(remainder)
#     break if number == 0
#   end
#   digits
# end

# def digit_list(number)
#   number.to_s.split('').map(&:to_i)
# end

# puts digit_list(12345) == [1, 2, 3, 4, 5]
# puts digit_list(7) == [7]
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
# puts digit_list(444) == [4, 4, 4]

# def is_odd?(number)
#   number.to_f%2 != 0.0
# end

# def is_odd?(number)
#   number % 2 == 1
# end