PASSWORD = "SecreT"

loop do
  puts ">> Please enter your password:"
  pass = gets.chomp
  break if pass == PASSWORD
  puts ">> Invalid password!"
end

puts "Welcome!"