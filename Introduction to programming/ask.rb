puts "Podaj wyraz, jak skonczysz nacisnij enter niczego nie wpisujac"

new = gets.chomp

array = []

array.push(new)

while new != ""
  new = gets.chomp
  array.push(new)
  array.each do |arr| 
     counter = 0 
     while counter < array.length
       print array
       old = ""
       if arr > array[counter] && arr != array[counter]
         old = array[counter]
         array[counter] = arr
         print array[counter-1]
         if array[counter-1] == arr
          print old
           array[counter-1] = old
          print array[counter-1]
         end
         print array[counter-1]

         counter = array.length
       else 
         if counter < array.length
           counter = counter + 1
         end
       end
     end
  end
end

puts array
