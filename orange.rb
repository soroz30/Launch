class OrangeTree

	def initialize
		@height = 0
		@age = 0
		@oranges = 0

		puts 'New orange tree created'
	end

	def height
		puts @height
	end

	def year
		yearPassed
	end

	def countTheOranges 
		puts @oranges
	end

	def pickTheOranges
		@oranges -= 1
		puts "An orange has been picked"
	end

	private

	def yearPassed
		@age += 1

		@oranges = 0

		if @age > 10
			puts "orange tree has died"
			exit
		end

		@height += 20

		produceFruit

	end

	def produceFruit
		if @height < 50 
			puts 'Too young tree'
		end

		counter = 2

		while counter < @age
			@oranges += 10
			counter += 1
		end

		if @oranges > 0 
			puts "Orange tree has " + @oranges.to_s + " oranges"
		end

	end

end

puts "Created orange tree, do you want to pick an orange, ask about the height or let the year pass?"

tree = OrangeTree.new

question = gets.chomp

while question != 'exit'

	tree.height if question == 'height'
	tree.countTheOranges if question == 'count'
	tree.year if question == 'year'

	puts "What's next?"
	question = gets.chomp

end