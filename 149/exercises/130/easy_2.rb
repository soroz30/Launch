def each_cons(array, n)
  array.each_index do |index|
    break if index + n - 1 >= array.size
    yield(*array[index..(index + n - 1)])
  end
end


# def each_cons(array)
#   array.each_with_index do |item, index|
#     break if index + 1 >= array.size
#     yield(item, array[index + 1])
#   end
# end




# def max_by(array)
#   return nil if array.empty?

#   max_element = array.first
#   largest = yield(max_element)

#   array[1..-1].each do |item|
#     yielded_value = yield(item)
#     if largest < yielded_value
#       largest = yielded_value
#       max_element = item
#     end
#   end

#   max_element
# end




# def each_with_object(array, object)
#   array.each { |item| yield(item, object) }
#   object
# end





# def each_with_index(array)
#   index = 0
#   while index < array.length
#     yield(array[index], index)
#     index += 1
#   end
#   array
# end

# each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end


# def drop_while(array)
#   index = 0
#   while index < array.size && yield(array[index])
#     index += 1
#   end

#   array[index..-1]
# end



# def count(*args)
#   args.inject(0) {|sum,i| yield(i) ? sum += 1 : sum += 0}
# end

# p count(1, 3, 6) { |value| value.odd? } == 2
# p count(1, 3, 6) { |value| value.even? } == 1
# p count(1, 3, 6) { |value| value > 6 } == 0
# p count(1, 3, 6) { |value| true } == 3
# p count() { |value| true } == 0
# p count(1, 3, 6) { |value| value - 6 } == 3



# def map(array)
#   result = []
#   array.each {|el| result.push(yield(el))}
#   result
# end

# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# def zip(array1, array2)
#   array1.map.with_index { |el, i| [el, array2[i]] }
# end



# def step(start_point, end_point, increment)
#   current_value = start_point
#   loop do
#     yield(current_value)
#     break if current_value + increment > end_point
#     current_value += increment
#   end
#   current_value
# end