require 'pry'

RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
SUITS = %w(Hearts Clubs Diamonds Spades).freeze

class Deck

  def initialize
    @deck = []
  end

  def draw
    card = nil
    loop do
      card = Card.new(RANKS.sample, SUITS.sample)
      break unless @deck.any? { |used_card| [card.rank, card.suit] == [used_card.rank, used_card.suit] }
    end
    @deck << card
    @deck = [] if @deck.length.eql?(52)
    card
  end
  end

class Array
  def min
    Card.min(self)
  end

  def max
    Card.max(self)
  end

  def to_s
    self.map { |card| "#{card.rank} of #{card.suit}" }
  end
end

class Card
  include Comparable

  CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 
          'Jack', 'Queen', 'King', 'Ace']
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def self.sort_cards(cards)
    cards.sort { |x,y| x <=> y }
  end

  def self.min(cards)
    select_card(cards, 0)
  end

  def self.max(cards)
    select_card(cards, -1)
  end

  def self.select_card(cards, index)
    sort_cards(cards)[index]
  end

  def <=>(other_card)
    if CARDS.index(self.rank) > CARDS.index(other_card.rank)
      1
    elsif CARDS.index(self.rank) < CARDS.index(other_card.rank)
      -1
    else
      0
    end 
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class PokerHand
  attr_reader :deck
  def initialize(deck)
    @deck = deck
  end

  def print
    puts @deck
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def number_of_ranks
    @deck.map { |c| @deck.select {|d| d.rank == c.rank}.length }
  end

  def royal_flush?
    deck.any? { |c| c.rank.eql?("Ace") } && straight_flush?
  end

  def straight_flush?
    deck.all? { |c| c.suit.eql?(deck[0].suit) } &&
    straight?
  end

  def four_of_a_kind?
    number_of_ranks.include?(4)
  end

  def full_house?
    number_of_ranks.include?(3) && number_of_ranks.include?(2)
  end

  def flush?
    @deck.all? {|c| c.suit == @deck[0].suit }
  end

  def straight?
    RANKS.each_cons(5).include? (Card.sort_cards(@deck).map {|c| c.rank})
  end

  def three_of_a_kind?
    number_of_ranks.include?(3)
  end

  def two_pair?
    number_of_ranks.count(2) > 2
  end

  def pair?
    number_of_ranks.include?(2)
  end
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'

# deck = Deck.new
# drawn = []
# 52.times { drawn << deck.draw }
# p drawn.count { |card| card.rank == 5 } == 4
# p drawn.count { |card| card.suit == 'Hearts' } == 13

# drawn2 = []
# 52.times { drawn2 << deck.draw }
# p drawn != drawn2 # Almost always.

# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8


# class PingGame
#   include Comparable
#   RESULTS_MESSAGES = [
#     "You win!",
#     "Your guess is too high",
#     "Your guess is too low"
#   ]

#   def initialize(range_low, range_high)
#     @range_low = range_low
#     @range_high = range_high
#   end

#   def play
#     @number = rand(@range_low..@range_high)
#     @guesses = Math.log2(@range_high - @range_low).to_i + 1
#     loop do
#       puts "You have #{@guesses} remaining."
#       puts "Enter a number between #{@range_low} and #{@range_high}"
#       user_number = STDIN.gets.chomp.to_i
#       case user_number
#         when @range_low..@range_high
#           puts RESULTS_MESSAGES[user_number <=> @number]
#         else 
#           puts "Invalid guess"
#       end
#       break if user_number.eql?(@number) || @guesses == 1
#       @guesses -= 1
#     end
#     puts "You are out of guesses. You lose." if @guesses == 1
#   end
# end

# game = PingGame.new(501, 1500)
# game.play

# class Minilang
#   def initialize(string)
#     @register = 0
#     @operations = string.split.map { |op| op =~ /^-?\d+$/ ? op.to_i : op }
#     @stack = []
#   end

#   def eval
#     @operations.each do |operation|
#       case operation
#         when "PRINT" then @register.nil? ? puts("Empty stack!") : puts(@register)
#         when "PUSH" then @stack.push(@register)
#         when "POP" then @register = @stack.pop
#         when "ADD" then @register += @stack.pop
#         when "SUB" then @register -= @stack.pop
#         when "MULT" then @register *= @stack.pop
#         when "DIV" then @register /= @stack.pop
#         when "MOD" then @register %= @stack.pop
#         when Integer then @register = operation
#         else return puts "Invalid token: #{operation}"
#       end
#     end
#     nil
#   end
# end

# Minilang.new('PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

# Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)





# require 'pry'

# class CircularQueue
#   def initialize(number)
#     @queue = Array.new  
#     @limit = number
#   end

#   def dequeue
#     @queue.shift
#   end

#   def enqueue(element)
#     @queue.push(element)
#     dequeue if @queue.length > @limit
#     #binding.pry
#   end
# end

# queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil





# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end

# class Graduate < Student
#   def initialize(name, year, parking=false)
#     super(name, year)
#     @parking = parking
#   end
# end

# class Undergraduate < Student
#   def initialize(name, year)
#     super(name, year)
#   end
# end





# class FixedArray
#   def initialize(number)
#     @length_limit = number
#     @array = Array.new(number)
#   end

#   def [](index)
#     raise IndexError unless (-@length_limit...@length_limit).cover? index
#     @array[index]
#   end

#   def []=(index, element)
#     raise IndexError unless (-@length_limit...@length_limit).cover? index
#     @array[index] = element
#   end

#   def to_a
#     @array
#   end

#   def to_s
#     @array.to_s
#   end
# end

# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end





# class Machine
#   def start
#     flip_switch(:on)
#   end

#   def stop
#     flip_switch(:off)
#   end

#   def show_state
#     puts switch
#   end

#   private

#   attr_writer :switch
#   attr_reader :switch

#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end