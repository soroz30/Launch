puts "What is your age in years?"
age = gets.chomp
puts "Please enter a correct number" if age.to_f <= 0
puts "You are " + (age.to_i*12).to_s + " months old." if age.to_f > 0