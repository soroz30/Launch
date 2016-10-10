require 'pry'


def penultimate(string)
  string.match(/.*\b(\w+)+\s(.+)\z/)[1]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# def penultimate(string)
#   words_array = words.split
#   words_array[-2]
# end


# def multiply_all_pairs(arr1, arr2)
#   arr1.product(arr2).map {|i| i.inject(:*)}.sort
# end


# p multiply_all_pairs([2, 4], [4, 3, 1, 2])



# def multiply_list(arr1, arr2)
#   arr1.map.with_index { |i, index| i * arr2[index] }
# end

# def multiply_list(arr1, arr2)
#  arr1.zip(arr2)(:*)
# end

# [3, 5, 7].zip([9, 10, 11]).map { |i| i.inject(:+)}

# p multiply_list([3, 5, 7], [9, 10, 11])


# def show_multiplicative_average(array)
#   puts format("%#.3f", array.inject(:*) / array.length.to_f) #tutaj musi byc puts
#   #to wydrukuje w formie floata
# end

# show_multiplicative_average([3, 5])



# def staggered_case(string)
#   result = ''
#   need_upper = string[0].match(/[a-z]/) ? false : true
#   string.chars.each do |char|
#     if char =~ /[a-z]/i
#       if need_upper
#         result += char.upcase
#       else
#         result += char.downcase
#       end
#       need_upper = !need_upper
#     else
#       result += char
#     end
#   end
#   result
# end


# p staggered_case('I Love Launch School!')

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'



# def swapcase(string)
#   characters = string.chars.map do |character|
#     if character.match(/[a-z]/)
#       character.upcase!
#     elsif character.match(/[A-Z]/)
#       character.downcase!
#     end 
#     character
#   end
#   characters.join
# end

# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'


# def word_cap(string)
#   result = string.split.map do |word| 
#     word[0] = (word[0].ord - 32).chr if word[0].match(/[a-z]/)
#     word[0] + word.downcase[1..-1]
#   end
#   result.join(' ')
# end

#WAZNE przy p pokazywaly sie tu escapowe / przy putsie juz sie nie pojawiaja



# def word_cap(string)
#   string.split(' ').map(&:capitalize).join(' ')
# end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'




# def letter_case_count(string)
#   hash = {}
#   hash[:lowercase] = string.count('a-z')
#   hash[:uppercase] = string.count('A-Z')
#   hash[:neither] = string.count('^A-Za-z')
#   p hash
# end



# def letter_case_count(string)
#   counts = {}
#   characters = string.chars
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
#   counts
# end





# def letter_case_count(string)
#   hash = {lowercase: 0, uppercase: 0, neither: 0}
#   string.chars.each do |character|
#     char_number = character.ord
#     if char_number < 65 || char_number > 122
#       hash[:neither] += 1
#     elsif char_number >= 65 && char_number < 97
#       hash[:uppercase] += 1
#     else
#       hash[:lowercase] += 1
#     end
#   end
#   hash
# end

# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }



# def interleave(arr1, arr2)
#   arr1.zip(arr2).flatten
# end



# def interleave(array1, array2)
#   result = []
#   array1.each_with_index do |element, index|
#     result << element << array2[index]
#   end
#   result
# end



# def interleave(arr1, arr2)
#   (0...arr1.length).each_with_object([]) { |el, result| result.push(arr1[el], arr2[el]) }
# end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']