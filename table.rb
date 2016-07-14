lineWidth = 50


array = [["Chapter 1: Numbers", "page 1"], ["Chapter 2: Letters", "page 2"]]

n = 0
while n < array.length
puts array[n][0].ljust(lineWidth/2) + array[n][1].rjust(lineWidth/2)
n += 1
end
