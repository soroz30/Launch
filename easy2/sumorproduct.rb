p "Please enter an integer greater than 0:"
inte = gets.chomp

p "Enter 's' to compute the sum, 'p' to compute the product."
question = gets.chomp

a = (1..inte.to_i)

if question == "s"
  p "The sum of the integers between 1 and " + inte + " is " + (a.inject(:+)).to_s
elsif question == "p"
  p "The product of the integers between 1 and " + inte + " is " + (a.inject(:*)).to_s 
end