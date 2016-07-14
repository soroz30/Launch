arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if {|ele| ele[0] == "s"}

arr.delete_if {|word| word.start_with?("s", "w") }