#question 1
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

10.times do |i|
   "The Flintstones Rock!".rjust(i+flintstones.length)
end

#question 2
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
hash = {}
statement = "The Flintstones Rock"
statement.chars.uniq.delete(" ").each {|i| hash[i] = statement.count(i)}
hash

#question 3
puts "the value of 40 + 2 is #{40 + 2}"

puts "the value of 40 + 2 is " + (40 + 2).to_s

#question 4
From this we see that our array is being changed as we go (shortened and shifted), and the loop 
counter used by #each is compared against the current length of the array rather than its original
 length.
In our first example, the removal of the first item in the first pass changes the value found for
 the second pass.
In our second example, we are shortening the array each pass just as in the first example..
but the items removed are beyond the point we are sampling from in the abbreviated loop.

In both cases we see that iterators DO NOT work on a copy of the original array or from stale 
meta-data (length) about the array. They operate on the original array in real time.

# question 8
words.split.map { |word| word.capitalize }.join(' ')

#question 9
