p "What is your name?"

name = gets.chomp

if !(name.include? "!")
  p "Hello " + name
else
  name = name.gsub(/!/, "")
  p "HELLO " + name.upcase + ". WHY ARE WE SCREAMING?"
end