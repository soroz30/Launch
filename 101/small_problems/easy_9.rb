require 'pry'

def buy_fruit(grocery)
  grocery.map { |order| ((order[0] + " ") * order[1]).split(' ') }.flatten
end

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]



# def get_grade(s1, s2, s3)
#   result = (s1 + s2 + s3)/3

#   case result
#   when 90..100 then 'A' # tu mozna stosowac range, a nie && i ||
#   when 80..89  then 'B'
#   when 70..79  then 'C'
#   when 60..69  then 'D'
#   else              'F'
#   end
# end


# def get_grade(*grades)
#   average = grades.inject(:+)/grades.length
#   case  
#   when average >= 90 then 'A'
#   when average >= 80 then 'B'
#   when average >= 70 then 'C'
#   when average >= 60 then 'D'
#   when average < 60 then 'F'
#   end
# end

# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"

# def sequence(count, first)
#   1.upto(count).map { |i| i * first }
# end 

# def sequence(count, first)
#   (1..count).map { |idx| idx * first }
# end

# p sequence(5, 1) == [1, 2, 3, 4, 5]
# p sequence(4, -7) == [-7, -14, -21, -28]
# p sequence(3, 0) == [0, 0, 0]
# p sequence(0, 1000000) == []

# def swap_name(name)
#   [name.match(/^\w+/), name.match(/\w+$/)].reverse.join(', ')
# end

# def swap_name(name)
#   name.split(' ').reverse.join(', ')
# end

# def swap_name(name)
#   name.sub(/(\w+)\s(\w+)/, '\2, \1')
# end

# def swap_name(str)
#   "#{str.split[1]}, #{str.split[0]}"
# end

# p swap_name('Joe Roberts') 


# def word_lengths(string)
#   string.split.map {|word| "#{word} #{word.length}"}
# end

# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# p word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# p word_lengths("") == []


# def uppercase?(string)
#   string == string.upcase
# end

# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true


# def sequence(number)
#   (1..number).to_a
# end

# def sequence(number)
#   (1..number).each_with_object([]) { |i, a| a << i }
# end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]


# def negative(number)
#   number > 0 ? -number : number
# end

# def negative(number)
#   -number.abs
# end



# def twice(number)
#     length = number.to_s.size
#     q, r = number.divmod(10**(length/2))
#     if length.even? && q == r
#         number
#     else
#         number * 2
#     end
# end


# def twice(number)
#   string_number = number.to_s
#   center = string_number.size / 2
#   left_side = center.zero? ? '' : string_number[0..center - 1]
#   right_side = string_number[center..-1]

#   return number if left_side == right_side
#   return number * 2
# end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

# def greetings(ary, hsh)
#     "=> Hello, #{ary.join(' ')}! Nice to have a #{hsh.values.join(' ')} around."
# end

# def greetings(array, hash)
#   puts "=> Hello #{array.join(' ')} to have a #{hash[:title]} #{hash[:occupation]} around. "
# end

# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })