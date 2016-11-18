require 'pry'


# def merge_sort(array)
#   return array if array.size == 1

#   sub_array_1 = array[0...array.size / 2]
#   sub_array_2 = array[array.size / 2...array.size]

#   sub_array_1 = merge_sort(sub_array_1)
#   sub_array_2 = merge_sort(sub_array_2)

#   merge(sub_array_1, sub_array_2)
# end


# def merge(arr1, arr2)
#   new_array = [] + arr1
#   arr2.each do |arr2obj|
#     index = new_array.index { |arr1obj| arr1obj > arr2obj }
#     index.nil? ? new_array.push(arr2obj) : new_array.insert(index, arr2obj)
#   end
#   new_array
# end

# p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]

# def my_method(array)
#   if array.empty?
#     []
#   elsif array.size > 1
#     array.map do |value|
#       value * value
#     end
#   else
#     [7 * array.first]
#   end
# end

# p my_method([])
# p my_method([3])
# p my_method([3, 4])
# p my_method([5, 6, 7])


# def rotate90(matrix)
#   0.upto(matrix[0].size - 1).map do |col|
#     matrix.reverse.map do |row|
#       row[col]
#     end
#   end
# end

# def rotate(matrix, degrees)
#   cycles = degrees / 90
#   cycles.times do
#     matrix = rotate90(matrix)
#   end
#   matrix
# end


# def rotate180(matrix)
#   (-matrix[0].length+1..0).map do |col|
#     (-matrix[-col].length+1..0).map {|i| matrix[-col][-i]}
#   end
# end

# def rotate90(matrix)
#   (0...matrix[0].length).map do |col|
#     (-matrix.length+1..0).map do |m|
#       matrix[-m][col]
#     end
#   end
# end

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# matrix = rotate180(matrix)

# p matrix


# matrix1 = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# matrix2 = [
#   [3, 7, 4, 2],
#   [5, 1, 0, 8]
# ]

# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2
# def transpose(matrix)
#   0.upto(matrix[0].size - 1).map do |col|
#     matrix.map do |row|
#       row[col]
#     end
#   end
# end


# def transpose(matrix)
#   new_matrix = []
#   (0..matrix[0].length-1).each do |i|
#     new_matrix.push([])
#     matrix.each { |ele| new_matrix[i].push(ele[i]) }
#   end
#   new_matrix
# end


# p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
# p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
#   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# p transpose([[1]]) == [[1]]



# def transpose(arr)

#   newarr = Marshal.load(Marshal.dump(arr)) # that was the only way to copy the array without 
#   newarr[0][1] , newarr[1][0] = newarr[1][0], newarr[0][1] # the original arr
#   newarr[0][2] , newarr[2][0] = newarr[2][0], newarr[0][2]
#   newarr[1][2], newarr[2][1] = newarr[2][1], newarr[1][2]
#   newarr
# end

# def transpose!(matrix)
#   size = matrix.size - 1
#   0.upto(size - 1) do |i| #0 do 1
#     (i + 1).upto(size) do |j| #1 do 2
#       matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
#     end
#   end
#   matrix
# end

# matrix = [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# transpose!(matrix)

# p matrix

# def transpose(matrix)
#   result = []
#   (0..2).each do |column_index|
#     new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
#     result << new_row
#   end
#   result
# end

# def transpose!(matrix)
#   new_matrix = transpose(matrix)
#   matrix.each.with_index do |ele, index|
#     (0...ele.length).each {|i| ele[i] = new_matrix[index][i]}
#   end
# end

# matrix = [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# transpose!(matrix)

# p matrix

# def transpose(matrix)
#   new_matrix = []
#   (0...matrix.length).each do |i|
#     new_matrix.push([])
#     matrix.each {|m| new_matrix[i].push(m[i])}
#   end
#   new_matrix
# end

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# def sin
#   puts "                                             *     *     *"
#   puts "                                          *"
#   puts " *                                     *"
#   puts "   *                                 *"
#   puts "    *                               *"
#   puts "     *                             *"
#   puts "      *                           *"
#   puts "        *                       *"
#   puts "           *                 *"
#   puts "              *     *     *"
# end

# puts "#{sin}#{sin}"

# def print_row(grid_size, distance_from_center)
#   number_of_spaces = distance_from_center - 1
#   spaces = ' ' * number_of_spaces
#   output = Array.new(3, '*').join(spaces)
#   puts output.center(grid_size)
# end

# def star(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(1) { |distance| print_row(grid_size, distance) }
#   puts '*' * grid_size
#   1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
# end







# def star(number)
#   stars_lines = number/2
#   (-stars_lines+1..0).each {|i| puts "*#{" " * -i}*#{" " * -i}*".center(number)}
#   puts "*" * number
#   (0..stars_lines-1).each {|i| puts "*#{" " * i}*#{" " * i}*".center(number)}
# end

# star(11)


# ADJECTIVES = %w(quick lazy sleepy ugly).freeze
# NOUNS      = %w(fox dog head leg cat tail).freeze
# VERBS      = %w(spins bites licks hurdles).freeze
# ADVERBS    = %w(easily lazily noisly excitedly).freeze

# File.open('madlibs.txt') do |file|
#   file.each do |line|
#     puts format(line, noun:      NOUNS.sample,
#                       verb:      VERBS.sample,
#                       adjective: ADJECTIVES.sample,
#                       adverb:    ADVERBS.sample)
#   end
# end