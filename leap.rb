puts "Year?"

year = gets.chomp.to_i

puts "2nd year?"

year2 = gets.chomp.to_i

if year > year2
  higherYear = year
  lowerYear = year2
else
  higherYear = year2
  lowerYear = year
end

while lowerYear <= higherYear

  if lowerYear % 4 == 0
    if lowerYear % 400 == 0
      puts lowerYear.to_s + " is a leap year"
    else
       if lowerYear % 100 == 0
         puts lowerYear.to_s + " is not a leap year"
       else
         puts lowerYear.to_s + " is a leap year"
       end
    end
  
  else

    puts lowerYear.to_s + " is not a leap year"
  
  end

  lowerYear = lowerYear. + 1

end    
