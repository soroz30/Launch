numbers = []

loop do
  puts "Enter any number:"
  input = gets.chomp.to_i
  numbers << input
  if numbers.length > 4
    break
  end
end

puts numbers