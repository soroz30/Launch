def recursion(number)
  puts number
  if number > 0
    number -= 1
    recursion(number)
  end
end

recursion(6)