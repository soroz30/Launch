p "What is the bill"
bill = gets.chomp.to_i
p "What is the tip percentage"
percent = gets.chomp
amount = bill * (percent.to_i * 0.01)

p "The tip is $" + amount.to_s
p "The total is $" + (bill + amount).to_s