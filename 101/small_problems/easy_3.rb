def palindromic_number?(number)
  palindrome?(number.to_s)
end


# def real_palindrome?(string)
#   string = string.downcase.delete('^a-z0-9')
#   palindrome?(string)
# end


# def real_palindrome?(string)
#   string = string.downcase.scan(/[a-z0-9]/)
#   string == string.reverse
# end


# p real_palindrome?('madam') == true
# p real_palindrome?('Madam') == true           # (case does not matter)
# p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# p real_palindrome?('356653') == true
# p real_palindrome?('356a653') == true
# p real_palindrome?('123ab321') == false





# def palindrome_array?(array)
#   array == array.reverse
# end

# p palindrome_array?([1,2,1])
# p palindrome_array?([1,2,3])


# def palindrome?(string)
#   string == string.reverse
# end

# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true


# def oddities(array)
#   array.select.with_index { |i, index| index % 2 == 0}
# end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []


# require 'pry'
# def xor?(bool1, bool2)
#   binding.pry
#   [bool1, bool2].count(true) == 1 ? true : false
# end

# xor?(5.odd?, 4.even?) 

# p xor?(5.even?, 4.even?) == true
# p xor?(5.odd?, 4.odd?) == true
# p xor?(5.odd?, 4.even?) == false
# p xor?(5.even?, 4.odd?) == false


# def xor?(value1, value2)
#   return true if value1 && !value2
#   return true if value2 && !value1
#   false
# end

# def square(n)
#   multiply(n, n)
# end


# def square(n)
#   n**2
# end

# p square(5) == 25
# p square(-8) == 64


# def multiply(a, b)
#   a * b
# end

# p multiply(5, 3) == 15


# print 'Please write word or multiple words: '
# input = gets.chomp
# number_of_characters = input.delete(' ').size
# puts "There are #{number_of_characters} characters in \"#{input}\"."



# puts "Please write word or multiple word: "
# answer = gets.chomp
# length = answer.split(" ").join("").length

# puts "There are #{length} characters in \"#{answer}\""




# def prompt(message)
#   puts "==> #{message}"
# end

# prompt("Enter the first number:")
# first_number = gets.chomp.to_i
# prompt("Enter the second number:")
# second_number = gets.chomp.to_i

# prompt("#{first_number} + #{second_number} = #{first_number + second_number}")
# prompt("#{first_number} - #{second_number} = #{first_number - second_number}")
# prompt("#{first_number} * #{second_number} = #{first_number * second_number}")
# prompt("#{first_number} / #{second_number} = #{first_number / second_number}")
# prompt("#{first_number} % #{second_number} = #{first_number % second_number}")
# prompt("#{first_number} ** #{second_number} = #{first_number**second_number}")



# puts "==> Enter the first number:"
# first_num = gets.chomp.to_i

# puts "==> Enter the second number:"
# second_num = gets.chomp.to_i

# puts "==> #{first_num} + #{second_num} = #{first_num + second_num}"
# puts "==> #{first_num} - #{second_num} = #{first_num - second_num}"
# puts "==> #{first_num} * #{second_num} = #{first_num * second_num}"
# puts "==> #{first_num} / #{second_num} = #{first_num / second_num}"
# puts "==> #{first_num} % #{second_num} = #{first_num % second_num}"
# puts "==> #{first_num} - #{second_num} = #{first_num - second_num}"
# puts "==> #{first_num} ** #{second_num} = #{first_num ** second_num}"




# array = []
# (1..6).each do |n|
#   puts "Enter the #{n}st number:"
#   answer = gets.chomp.to_i
#   array.push(answer)
# end

# puts "Enter the last number:"
# answer = gets.chomp.to_i
# case array.include?(answer)
# when true then p "The number #{answer} appears in #{array}"
# when false then p "The number #{answer} does not appear in #{array}"
# end


# numbers = []

# puts "Enter the 1st number:"
# numbers << gets.chomp.to_i
# puts "Enter the 2nd number:"
# numbers << gets.chomp.to_i
# puts "Enter the 3rd number:"
# numbers << gets.chomp.to_i
# puts "Enter the 4th number:"
# numbers << gets.chomp.to_i
# puts "Enter the 5th number:"
# numbers << gets.chomp.to_i
# puts "Enter the last number:"
# last_number = gets.chomp.to_i

# if numbers.include? last_number
#   puts "The number #{last_number} appears in #{numbers}."
# else
#   puts "The number #{last_number} does not appear in #{numbers}."
# end