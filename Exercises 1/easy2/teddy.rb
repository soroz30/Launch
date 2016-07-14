a = rand(20..200)
name = gets.chomp
name = "Teddy" if name == "" 
p name + " is" + a.to_s + " years old!"