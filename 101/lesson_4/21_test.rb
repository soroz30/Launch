SUITS = %w(H D S C).freeze
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze

WINNING_SCORE = 5
DEALER_MINIMUM = 17
GAME_MAX_TOTAL = 21

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value == 'A'
             11
           elsif value.to_i.zero? # J, Q, K
             10
           else
             value.to_i
           end
  end

  # correct for Aces
  values.count { |value| value == "A" }.times do
    sum -= 10 if sum > GAME_MAX_TOTAL
  end

  sum
end

def busted?(cards)
  total(cards) > GAME_MAX_TOTAL
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > GAME_MAX_TOTAL
    :player_busted
  elsif dealer_total > GAME_MAX_TOTAL
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  puts "-------------"
  2.times { prompt "" }
  answer = ''
  loop do
    prompt "Do you want to play again? (y or n)"
    answer = gets.chomp.downcase
    break if ['y', 'yes', 'n', 'no'].include?(answer)
    prompt "Sorry, must enter y/yes or n/no."
  end
  ['y', 'yes'].include?(answer)
end

def display_cards(dealer_cards, player_cards, dealer_hidden)
  puts "=============="
  dealer_arr = []
  dealer_cards.each_with_index do |card, index|
    dealer_arr << if index.zero?
                    card.to_s
                  else
                    (dealer_hidden ? "(Hidden)" : card.to_s)
                  end
  end
  dealer_cards_str = dealer_arr.join(", ")
  total_str = dealer_hidden ? "(Hidden)" : total(dealer_cards).to_s

  prompt "Dealer has [#{dealer_cards_str}], for a total of: #{total_str}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=============="
end

def display_score(dealer_score, player_score)
  prompt "Dealer score: #{dealer_score}, player score: #{player_score}"
end

def game_won?(dealer_score, player_score)
  dealer_score == WINNING_SCORE || player_score == WINNING_SCORE
end

def display_won_message(dealer_score, player_score)
  if dealer_score == WINNING_SCORE
    prompt "Dealer won the game!"
  elsif player_score == WINNING_SCORE
    prompt "Player won the game!"
  end
end

dealer_score = 0
player_score = 0

prompt "Welcome to Twenty-One!"

loop do
  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  display_score(dealer_score, player_score)
  display_cards(dealer_cards, player_cards, true)

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 'hit', 's', 'stay'].include?(player_turn)
      prompt "Sorry, must enter h/hit or s/stay."
    end
    if ['s', 'stay'].include?(player_turn)
      prompt "You stayed at #{total(player_cards)}"
      break
    end

    prompt "You chose to hit!"
    player_cards << deck.pop
    display_cards(dealer_cards, player_cards, true)
    break if busted?(player_cards)
  end

  unless busted?(player_cards)
    # dealer turn
    prompt "Dealer turn..."

    loop do
      break if busted?(dealer_cards) || total(dealer_cards) >= DEALER_MINIMUM

      prompt "Dealer hits!"
      dealer_cards << deck.pop
      display_cards(dealer_cards, player_cards, false)
    end

    unless busted?(dealer_cards)
      prompt "Dealer stays at #{total(dealer_cards)}"
    end
  end

  # if player_busted, dealer cards are hidden so far, display them
  display_cards(dealer_cards, player_cards, false) if busted?(player_cards)

  display_result(dealer_cards, player_cards)
  if [:player, :dealer_busted].include?(
    detect_result(dealer_cards, player_cards)
  )
    player_score += 1
  elsif [:dealer, :player_busted].include?(
    detect_result(dealer_cards, player_cards)
  )
    dealer_score += 1
  end
  display_score(dealer_score, player_score)

  if game_won?(dealer_score, player_score)
    display_won_message(dealer_score, player_score)
    dealer_score = 0
    player_score = 0
  end

  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"