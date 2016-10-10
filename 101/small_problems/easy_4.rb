require 'pry'

# def signed_integer_to_string(int)
#   ['','+','-'][int <=> 0] + integer_to_string(int.abs)
# end

# def signed_integer_to_string(number)
#   case number <=> 0
#   when -1 then "-#{integer_to_string(-number)}"
#   when +1 then "+#{integer_to_string(number)}"
#   else         integer_to_string(number)
#   end
# end


# DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

# def integer_to_string(number)
#   result = ''
#   number = number.abs
#   loop do
#     number, remainder = number.divmod(10)
#     result.prepend(DIGITS[remainder])
#     break if number == 0
#   end
#   result
# end

# def signed_integer_to_string(integer)
#   if integer > 0 
#     "+" + integer_to_string(integer)
#   elsif integer < 0
#       "-" + integer_to_string(integer)
#     else
#       integer_to_string(integer)
#   end
# end

# p signed_integer_to_string(4321) == '+4321'
# p signed_integer_to_string(-123) == '-123'
# p signed_integer_to_string(0) == '0'


# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
# }

# def string_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char] }

#   value = 0
#   digits.each { |digit| value = 10 * value + digit }
#   value
# end


# def string_to_signed_integer(string)
#   case string[0]
#   when '-' then -string_to_integer(string[1..-1])
#   when '+' then string_to_integer(string[1..-1])
#   else          string_to_integer(string)
#   end
# end

# puts string_to_signed_integer('-4321')




# def string_to_integer(string)
#   string.split('').map {|i| (i.ord-48).ord }.inject{|a,i| a*10 + i}
# end

# puts string_to_integer("1234")

# def running_total(array)
#   array.map!.with_index { |num, i| i == 0 ? num : num + array[i-1] }
# end


# def running_total(array)
#   sum = 0
#   array.each_with_object([]) do |number, new_array|
#     new_array << sum += number
#   end
# end

# def running_total(array)
#   array.map.with_index do |_, index|
#     array[0..index].inject(:+)
#   end
# end



# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end

# p running_total([2, 5, 13])




# 

# def leap_year?(year)
#   if year < 1752
#     return true if (year % 4 == 0)
#     return false
#   else
#     (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
#   end
# end


# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == true
# p leap_year?(1) == false
# p leap_year?(100) == true
# p leap_year?(400) == true



# def leap_year?(year)
#   (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
# end

# def leap_year?(year)
#   if (year % 400).zero? 
#     return true
#   elsif (year % 4).zero? && year % 100 != 0 
#     return true
#   end
#   false
# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true




# def century(year)
#   century = year / 100 + 1
#   century -= 1 if year % 100 == 0
#   century.to_s + century_suffix(century)
# end

# def century_suffix(century)
#   return 'th' if [11, 12, 13].include? century % 100
#   last_digit = century % 10

#   case last_digit
#   when 1 then 'st'
#   when 2 then 'nd'
#   when 3 then 'rd'
#   else 'th'
#   end
# end

# def century(year)
#   year.to_s[-1] == "0" ? century = (year/100).to_s : century = (year/100+1).to_s
#   ends_hash = Hash[0,"th",1,"st",2,"nd",3,"rd",4,"th",5,"th",6,"th",7,"th",8,"th",9,"th"]
#   "#{century}#{century[-2] != "1" ? ends_hash[century[-1].to_i] : "th"}"
# end

# p century(2000) == '20th'
# p century(2001) == '21st'
# p century(1965) == '20th'
# p century(256) == '3rd'
# p century(5) == '1st'
# p century(10103) == '102nd'
# p century(1052) == '11th'
# p century(1127) == '12th'
# p century(11201) == '113th'
# p century(1) == '1st'

# def short_long_short(string1, string2)
#   arr = [string1, string2].sort_by { |el| el.length }
#   arr.first + arr.last + arr.first
# end


# def short_long_short(string1, string2)
#   if string1.length > string2.length
#     string2 + string1 + string2
#   else
#     string1 + string2 + string1
#   end
# end


# def short_long_short(string1, string2)
#   sort = [string1, string2].sort! { |x,y| x.length <=> y.length }
#   "#{sort[0]}#{sort[1]}#{sort[0]}"
# end

# p short_long_short('abcde', 'fgh') == "fghabcdefgh"