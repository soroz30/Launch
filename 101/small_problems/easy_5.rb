require 'pry'



def print_multiple_in_box(string)
  puts '+' + ''.center(78, '-') + '+'
  puts '|' + ''.center(78) + '|'
  sentence_array = Array.new
  (0..(string.length / 70)).each do |i|
    sentence_array[i] = string[((i)*70)..(70*(i+1))]
  end
  sentence_array.each do |sentence|
    puts '+'.ljust(4) + "#{sentence}".center(71) + '+'.rjust(5)
  end
  puts '|' + ''.center(78) + '|'
  puts '+' + ''.center(78, '-') + '+'
end



print_multiple_in_box("holka  ")
# def print_in_box(string)
#   padding = string.size

#   puts <<~EOL
#   +-#{'-'*padding}-+
#   | #{' '*padding} |
#   | #{     string} |
#   | #{' '*padding} |
#   +-#{'-'*padding}-+
#   EOL
# end


# def print_in_box(message)
#   horizontal_rule = "+#{'-' * (message.size + 2)}"
#   empty_line = "|#{' ' * (message.size +2)}|"

#   puts horizontal_rule
#   puts empty_line
#   puts "| #{message} |"
#   puts empty_line
#   puts horizontal_rule
# end



# def print_in_box(string)
#   length = string.length
#   puts '+' + ''.center(length, '-') + '+'
#   puts '|' + ''.center(length) + '|'
#   puts '|' + "#{string}".center(length) + '|'
#   puts '|' + ''.center(length) + '|'
#   puts '+' + ''.center(length, '-') + '+'
# end

# print_in_box("wycwanila sie")

# def crunch(string)
#   string.gsub(/(.)\1+/, '\1')
# end


# def crunch(string)
#   words = string.split
#   words.map do |word|
#     word.gsub(/((.))\2+/) { |match| match[0] }
#   end
#   .join(' ')
# end


# def crunch(text)
#   index = 0
#   crunch_text = ''
#   while index <= text.length - 1
#     crunch_text << text[index] unless text[index] == text[index + 1]
#     index += 1
#   end
#   crunch_text
# end


# def crunch(string)
#   string.squeeze
# end

# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''

# NUMBERS = %w(zero one two three four five six seven eight nine ten eleven
#           twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)


# def alphabetic_number_sort(numbers)
#   numbers.sort! { |x,y| NUMBERS[x] <=> NUMBERS[y] }
# end

# p alphabetic_number_sort((0..19).to_a)


# def alphabetic_number_sort(integers)
#   integers.sort.map {|i| NUMBERS[i]}
# end

# p alphabetic_number_sort((0..19).to_a)


# def alphabetic_number_sort(numbers)
#   numbers.sort_by { |number| NUMBER_WORDS[number] }
# end

# def word_sizes(string)
#   string.split.each_with_object(Hash.new(0)) do |n, counts|
#     counts[n.length] += 1
#   end
# end


# def word_sizes(sentence)
#   sentence
#     .split
#     .group_by{|word| word.size} # wazna metoda
#     .inject({}) {|w_sizes, (size_num, words)| w_sizes[size_num] = words.length; w_sizes }
# end



# def word_sizes(string)
#   hash = Hash.new(0) # to wazne, dzieki temu nie musze sprawdzac czy jest nil, tylko od razu dodawac
#   string.split(' ').each do |word|
#     word = word.gsub(/\W/, "")
#     hash[word.length] += 1  
#   end
#   hash
# end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p word_sizes('') == {}


# LETTERS = ('a'..'z').to_a

# def cleanup(string)
#   with_spaces = string.chars.map do |char|
#     LETTERS.include?(char.downcase) ? char : " "
#   end
#   with_spaces.join.squeeze(" ")
# end


# def cleanup(string)
#   string.gsub!(/\W+/, " ")
# end

# p cleanup("---what's my +*& line?") == ' what s my line '


# word = "holka"

# def swap_first_last_characters(a, b)
#   a, b = b, a
# end

# p swap_first_last_characters(word[0], word[-1])

# p word

# def swap(word)
#   word.split(" ").map {|i| i.sub(/^(\w)(.*)(\w)$/, '\3\2\1')}.join(' ')
# end


# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'

# SECONDS_PER_MINUTE = 60
# MINUTES_PER_DAY = 1440

# def after_midnight(time_string)
#   ((Time.parse(time_string) - Time.parse('00:00')) / SECONDS_PER_MINUTE) % MINUTES_PER_DAY
# end

# def before_midnight(time_string)
#   ((Time.parse('24:00') - Time.parse(time_string)) / SECONDS_PER_MINUTE) % MINUTES_PER_DAY
# end





# HOURS_PER_DAY = 24
# MINUTES_PER_HOUR = 60
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

# def after_midnight(time_str)
#   hours, minutes = time_str.split(':').map(&:to_i)
#   (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
# end

# def before_midnight(time_str)
#   delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
#   delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
#   delta_minutes
# end

# def after_midnight(hour)
#   time = time.split(':').map(&:to_i)
#   time[0]*60 + time[1]
# end



# MINUTES_PER_HOURS = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOURS

# def time_of_day(delta_minutes)
#   delta_minutes = delta_minutes % MINUTES_PER_DAY
#   hours, minutes = delta_minutes.divmod(MINUTES_PER_HOURS)
#   format('%02d:%02d', hours, minutes)
# end


# def time_of_day(minutes)
#   format('%02d:%02d', minutes / 60 % 24, minutes % 60)
# end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"


# char = "a"

# char.ord.chr == char
# # => true 

# # Dealing with encoding.
# 97.chr(Encoding::UTF_8) == char
# # => true

# def ascii_value(ascii_string)
#   ascii_string == '' ? 0 : ascii_string.codepoints.reduce(:+)
# end

# def ascii_value(str) str.chars.map(&:ord).inject(0, :+) end

# def ascii_value(string)
#   string.chars.inject(0) {|sum, i| sum += i.ord}
# end

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0