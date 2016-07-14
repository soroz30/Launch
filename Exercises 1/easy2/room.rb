p "Enter the length of the room in meters:"
length = gets.chomp.to_f
p "Enter the width of the room in meters:"
width = gets.chomp.to_f

p "The area of the room is " + (length * width).to_s + " square meters (" + (length * width * 10.7639).to_s + " square feet)."