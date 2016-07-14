LOGIN = "admin"
PASSWORD = "SecreT"

loop do
  puts ">> Please enter user name:"
  user_name = gets.chomp
  puts ">> Please enter your password:"
  pass = gets.chomp
  break if user_name == LOGIN && pass == PASSWORD
  puts ">> Authorization failed!"
end

puts "Welcome!"