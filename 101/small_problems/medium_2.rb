require 'pry'
require 'time'

# def sum_square_difference(number)
#   number_range = (1..number).to_a 
#   number_range.inject(:+)**2 - number_range.map { |i| i ** 2 }.inject(:+)
# end

# p sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# p sum_square_difference(10) == 2640
# p sum_square_difference(1) == 0
# p sum_square_difference(100) == 25164150



# def bubble_sort!(array)
#   loop do
#     swapped = false
#     array.each.with_index do |ele, index| 
#       next_ele = array[index+1]
#       if next_ele.nil? || ele < next_ele
#         ele
#       elsif ele > next_ele
#         array[index+1] = ele
#         array[index] = next_ele
#         swapped = true
#       end
#     end
#     break unless swapped
#   end
# end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)



# def featured(number)
#   number += 1
#   number += 1 until number.odd? && number % 7 == 0

#   loop do
#     number_chars = numbers.to_s.split('')
#     return number if number_chars.uniq == number_chars
#     number += 14
#     break if number >= 9_876_543_210
#   end


# end


# def featured(number)
#   if number % 7 == 0
#    number += 7  
#   else
#     number += 1 while number % 7 != 0
#   end

#   loop do 
#     return number if number.to_s.chars.uniq.length == number.to_s.length && number.odd?
#     number += 7
#   end
# end

# p featured(999_999_987)

# def leap_year?(year)
#   (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
# end

# def second_day_before_month_end(year, month)
#   day = 27
#   day += 1 while Date.valid_date?(year, month, day)
#   Date::DAYNAMES[Date.new(year,month,day-2).wday]
# end

# p second_day_before_month_end(2016, 10)




# def friday_13th?(year)
#   unlucky_count = 0
#   thirteenth = Date.new(year, 1, 13)
#   11.times do
#     unlucky_count += 1 if thirteenth.friday?
#     thirteenth = thirteenth.next_month
#   end
#   unlucky_count
# end




# def friday_13th?(year)
#   date = Date.new(year)
#   counter = 0
#   1.upto(365) do |i|
#     counter += 1 if date.friday? && date.mday == 13
#     date = date + 1
#   end
#   counter
# end

# p friday_13th?(1986) == 1


# def triangle(*args)
#   return :invalid if args.inject(:+) != 180 || args.any? { |a| a <= 0}
#   args.include?(90) ? :right : args.any? { |a| a > 90} ? :obtuse : :acute
# end


# p triangle(60, 70, 50) == :acute
# p triangle(30, 90, 60) == :right
# p triangle(120, 50, 10) == :obtuse
# p triangle(0, 90, 90) == :invalid
# p triangle(50, 50, 50) == :invalid


# def triangle(*args)
#   return :invalid if args.any? { |s| s <= 0 } || args.min(2).inject(:+) <= args.max
#   {3 => :scalene, 2 => :isosceles, 1 => :equilateral}[args.uniq.length]
# end

# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid


# def balanced_2?(string)
#   lparens = ['(', '{', '[']
#   rparens = [')', '}', ']']
#   parens = { '(' => 0, '{' => 0, '[' => 0,
#              ')' => 0, '}' => 0, ']' => 0}
#   pairs = {}
#   string.each_char do |char|
#     parens[char] += 1 if lparens.include?(char)
#     parens[char] -= 1 if rparens.include?(char)
#     pairs = { '1' => parens['('] + parens[')'],
#               '2' => parens['{'] + parens['}'],
#               '3' => parens['['] + parens[']']
#             }
#     break if pairs.values.any? { |x| x < 0 }
#   end

#   pairs.values.all? { |x| x == 0 } && string.count("\'").even? &&
#   string.count("\"").even?
# end



# def balanced?(string)
#   parens = 0
#   string.each_char do |char|
#     parens += 1 if char == '('
#     parens -= 1 if char == ')'
#     break if parens < 0
#   end

#   parens.zero?
# end




# def balanced?(string)
#   string.sub!(/\((.+?)\)/, '\1') while string.match(/\((.+?)\)/)
#   string.count("()") == 0
# end

# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false


# def letter_percentages(string)
#   counts = { lowercase: 0, uppercase: 0, neither: 0 }
#   percentages = { lowercase: [], uppercase: [], neither: [] }
#   characters = string.chars
#   length = string.length

#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

#   calculate(percentages, counts, length)

#   percentages
# end

# def calculate(percentages, counts, length)
#   percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
#   percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
#   percentages[:neither] = (counts[:neither] / length.to_f) * 100
# end




# def letter_case_count(string)
#   counts = {}
#   characters = string.chars
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
#   counts
# end

# def letter_percentages(string)
#   length = string.split('').length
#   case_count = letter_case_count(string)
#   num_of_chars = case_count.values.inject(:+)
#   case_count.map { |k, v| case_count[k] = sprintf("%g", v.to_f*100/num_of_chars)}
#   case_count
# end

# puts letter_percentages('abCdef 123')
# puts letter_percentages('AbCd +Ef')
# puts letter_percentages('123')




# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(word)
#   BLOCKS.select {|b| (word.chars & b.chars).size >= 2}.empty?
# end




# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(string)
#   up_string = string.upcase
#   BLOCKS.none? { |block| up_string.count(block) >= 2 }
# end

# p block_word?("batch")

# BLOCKS = Array('B'=>'O', 'X'=>'K', 'D'=>'Q', 'C'=>'P', 
#               'N'=>'A', 'G'=>'T', 'R'=>'E', 'F'=>'S',
#               'J'=>'W', 'H'=>'U', 'V'=>'I', 'L'=>'Y',
#               'Z'=>'M').freeze

# def block_word?(string)
#   BLOCKS.each { |block| return false if block.all? {|i| string.include?(i)}  }
#   true
# end

# p block_word?('BATCH')
# p block_word?('BUTCH')
# p block_word?('jest')



# a = "Four score and seven years ago our fathers brought forth
# on this continent a new nation, conceived in liberty, and
# dedicated to the proposition that all men are created
# equal.

# Now we are engaged in a great civil war, testing whether
# that nation, or any nation so conceived and so dedicated,
# can long endure. 'We are met on a great battlefield of that
# war. We have come to dedicate a portion of that field, as
# a final resting place for those who here gave their lives
# that that nation might live.' It is altogether fitting and
# proper that we should do this.

# But, in a larger sense, we can not dedicate, we can not
# consecrate, we can not hallow this ground. 'The brave
# men, living and dead, who struggled here, have
# consecrated it, far above our poor power to add or
# detract.' The world will little note, nor long remember
# what we say here, but it can never forget what they
# did here. It is for us the living, rather, to be dedicated
# here to the unfinished work which they who fought
# here have thus far so nobly advanced. 'It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth.'".split(/\.|\?|!/).max_by { |sentence| sentence.split.size}.strip.split.size

# puts a