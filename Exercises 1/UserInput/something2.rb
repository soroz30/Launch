puts "Do you want me to print something? (y/n)"

input = gets.chomp.downcase

while input != "y" && input != "n"
  puts "Invalid input! Please enter y or n"
  input = gets.chomp.downcase
end

puts "something"