def amethod(param)
  #zmieni str, bo jest destructive method
  param << " world"

  #bez erroru, ale sie nie zmieni. Nie zmienia obiektu, bo nie jest destructive method 
  #param += " world"
  #param + " world" to jest inne to linijke wyzej
  
  #nic nie zmieni bo jest w innym zakresie i error
  #str += " world" 
end

str = "hello"
amethod(str)

p str


a = "hello"
b = a

b << " world" #destructive call, zmieni obie zmienne

# ---- 2 variables; 1 object

puts a
puts b