module DisplayMessages
  def display_hand
    puts ""
    prompt "#{name}'s cards:"
    cards.each do |card|
      puts "   #{card}"
    end
    prompt "Total: #{total}"
    puts ""
  end

  def display_flop
    player.display_flop
    dealer.display_flop
  end

  def display_player_busted
    prompt "#{player.name} busted! #{dealer.name} wins!"
    puts ""
  end

  def display_dealer_busted
    prompt "#{dealer.name} busted! #{player.name} wins!"
    puts ""
  end

  def display_busted
    if player.busted?
      display_player_busted
    elsif dealer.busted?
      display_dealer_busted
    end
  end

  def display_cards
    player.display_hand
    dealer.display_hand
  end

  def display_result
    case round_winner
    when :player then prompt "#{player.name} wins!\n"
    when :dealer then prompt "#{dealer.name} wins!\n"
    when :tie then prompt "It's a tie!"
    end
  end

  def display_bankroll
    prompt "Actual bankroll is #{bankroll.money}$"
  end

  def display_player_turn
    prompt "#{player.name}'s turn"
    puts ""
  end

  def display_player_stays
    puts "#{player.name} stays!"
    sleep 1
  end

  def display_dealer_turn
    puts ""
    prompt "#{dealer.name}'s turn..."
    puts ""
    sleep 1
  end

  def display_dealer_stays
    puts "#{dealer.name} stays!"
    sleep 1
  end

  def display_dealer_hits
    puts "#{dealer.name} hits!"
    sleep 1
  end

  def clear
    system "clear"
  end

  def prompt(message)
    puts "=> #{message}"
  end
end

module UserInput
  include DisplayMessages

  def set_name
    name = ''
    loop do
      prompt "What's your name?"
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, must enter a value."
    end

    self.name = name
  end

  def bankroll_size
    bankroll = nil

    loop do
      prompt "What's your bankroll in $?"
      bankroll = gets.chomp
      break unless bankroll.match(/^[1-9]\d*$/).nil?
      puts "Please use only positive integers"
    end

    bankroll.to_i
  end

  def choose_stake
    stake = nil

    loop do
      prompt "What's your stake?"
      stake = gets.chomp
      break unless stake_invalid?(stake)
    end

    @stake = stake.to_i
  end

  def invalid_integer_input?(integer)
    integer.match(/^[1-9]\d*$/).nil?
  end

  def invalid_stake_amount?(stake)
    @money < stake
  end

  def stake_invalid?(stake)
    if invalid_integer_input?(stake)
      puts "Please use only positive integers"
      return true
    end

    if invalid_stake_amount?(stake.to_i)
      puts "Stake cannot be higher than the bankroll"
      return true
    end

    false
  end

  def hit_or_stay
    prompt "Would you like to (h)it or (s)tay?"
    answer = nil

    loop do
      answer = gets.chomp.downcase
      break if %w(h s).include?(answer)
      puts "Sorry, must enter 'h' or 's'."
    end

    answer
  end

  def play_again?
    answer = nil

    loop do
      prompt "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n."
    end

    @again = answer == 'y'
  end

  def increase_bankroll?
    answer = nil

    loop do
      prompt "Would you like to increase your bankroll? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end
end

module Hand
  include DisplayMessages

  ACE_VALUE = 11
  PICTURE_CARD_VALUE = 10

  def calculate_card_value(card)
    if card.ace?
      @total += ACE_VALUE
    elsif card.jack? || card.queen? || card.king?
      @total += PICTURE_CARD_VALUE
    elsif (2..10).cover? card.face.to_i
      @total += card.face.to_i
    end
  end

  def total
    @total = 0
    cards.each do |card|
      calculate_card_value(card)
    end

    calculate_aces(cards)

    @total
  end

  def add_card(new_card)
    cards << new_card
  end

  def calculate_aces(cards)
    cards.select(&:ace?).count.times do
      break if @total <= TwentyOne::WINNING_SCORE
      @total -= 10
    end
  end

  def busted?
    total > TwentyOne::WINNING_SCORE
  end
end

module PlayersTurns
  include DisplayMessages, UserInput

  def player_hits
    player.add_card(deck.deal_one)
    puts "#{player.name} hits!"
    sleep 1
    player.display_hand
  end

  def player_turn_loop
    loop do
      break if player.busted?
      answer = hit_or_stay

      if answer == 's'
        display_player_stays
        break
      else
        player_hits
      end
    end
  end

  def player_turn
    display_player_turn
    player_turn_loop
  end

  def dealer_points_limit
    dealer.total >= TwentyOne::HIT_LIMIT && !dealer.busted?
  end

  def dealer_hits
    display_dealer_hits
    dealer.add_card(deck.deal_one)
    dealer.display_hand
  end

  def dealer_turn_loop
    loop do
      if dealer_points_limit
        display_dealer_stays
        break
      elsif dealer.busted?
        break
      else
        dealer_hits
      end
    end
  end

  def dealer_turn
    display_dealer_turn
    dealer_turn_loop
  end
end

class Card
  SUITS = %w(H D S C).freeze
  FACES = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "The #{face} of #{suit}"
  end

  def face
    case @face
    when 'J' then 'Jack'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    when 'A' then 'Ace'
    else
      @face
    end
  end

  def suit
    case @suit
    when 'H' then 'Hearts'
    when 'D' then 'Diamonds'
    when 'S' then 'Spades'
    when 'C' then 'Clubs'
    end
  end

  def ace?
    face == 'Ace'
  end

  def king?
    face == 'King'
  end

  def queen?
    face == 'Queen'
  end

  def jack?
    face == 'Jack'
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end

    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end
end

class Participant
  include Hand, DisplayMessages

  attr_accessor :name, :cards
  def initialize
    @cards = []
    set_name
  end
end

class Player < Participant
  include UserInput

  def display_flop
    display_hand
  end
end

class Dealer < Participant
  ROBOTS = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].freeze

  def set_name
    self.name = ROBOTS.sample
  end

  def display_flop
    prompt "#{name}'s cards:"
    puts "   #{cards.first}"
    puts "   an unknown card "
    puts ""
  end
end

class Bankroll
  include UserInput

  attr_accessor :money, :stake

  def initialize
    @money = bankroll_size
  end

  def zero?
    @money.zero?
  end
end

class TwentyOne
  include DisplayMessages, UserInput, PlayersTurns

  WINNING_SCORE = 21
  HIT_LIMIT = 17

  attr_accessor :deck, :player, :dealer, :bankroll

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @bankroll = Bankroll.new
  end

  def reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  def player_wins?
    dealer.busted? || player.total > dealer.total && !player.busted?
  end

  def dealer_wins?
    player.busted? || player.total < dealer.total && !dealer.busted?
  end

  def round_winner
    if player_wins?
      :player
    elsif dealer_wins?
      :dealer
    else
      :tie
    end
  end

  def update_bankroll
    if round_winner == :player
      bankroll.money += bankroll.stake
    elsif round_winner == :dealer
      bankroll.money -= bankroll.stake
    end
  end

  def anyone_busted?
    player.busted? || dealer.busted?
  end

  def stake_and_dealing_cards
    clear
    bankroll.choose_stake
    deal_cards
    display_flop
  end

  def players_moves
    player_turn
    dealer_turn unless player.busted?
  end

  def round_loop
    loop do
      stake_and_dealing_cards
      players_moves
      after_hand
      break if bankroll.zero?
      play_again? ? reset : break
    end
  end

  def after_hand
    update_bankroll
    sleep 1
    display_cards unless anyone_busted?
    sleep 1
    display_result unless anyone_busted?
    display_busted if anyone_busted?
    sleep 1
    display_bankroll
  end

  def increasing_bankroll
    @bankroll = Bankroll.new
    reset
  end

  def start
    loop do
      round_loop
      break unless bankroll.zero? || @again
      prompt "You lost all your money!" if bankroll.zero?
      break unless increase_bankroll?
      increasing_bankroll
    end
    prompt "Thank you for playing Twenty-One. Goodbye!"
  end
end

game = TwentyOne.new
game.start
