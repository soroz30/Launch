def number(num)
  num = num.to_f
  if num > 0 && num <= 50
    puts "Between 0 and 50"
  elsif num > 50 && num <= 100 
    puts "Between 51 and 100"
  else
    puts "Above 100"
  end
end


def newnumber(num)
  num = num.to_i

    p num > 0
    p num <= 50
  case 
  when  num <= 50
    puts "Between 0 and 50"
  when num > 50 && num <= 100
    puts "Between 51 and 100"
  else
    puts "Above 100"
  end 
end

num = gets.chomp
newnumber(num)