require 'pry'
VALUES = {
  Two: 2,
  Three: 3,
  Four: 4,
  Five: 5,
  Six: 6,
  Seven: 7,
  Eight: 8,
  Nine: 9,
  Ten: 10,
  Jack: 10,
  Queen: 10,
  King: 10,
  Ace: 11
}.freeze
INVALID = 'That\'s not a valid input'.freeze
SUITS = %w(Hearts Diamonds Clubs Spades).freeze

def prompt(message)
  puts("=> #{message}")
end

def deal_cards
  "#{VALUES.keys.sample} of #{SUITS.sample}"
end

def add_unique_card(deck)
  card = ''
  loop do
    card = deal_cards
    break if deck.none? { |_, v| v.include?(card) }
  end
  card
end

def first_shuffle
  deck = { Player: [], Dealer: [] }
  deck.keys.each do |key|
    (0..1).each { |_| deck[key].push(add_unique_card(deck)) }
  end
  deck
end

def show_dealer_hand(players_cards)
  puts "Dealer's cards: #{players_cards[:Dealer][0]} and unknown card"
end

def show_all_cards(players_cards, player)
  puts "#{player}\'s cards: #{players_cards[player].join(', ')}"
end

def show_points(players_points, player)
  puts "#{player}\'s cards value: #{players_points[player]}"
end

def sum_points(players_cards, players_points, player)
  sum = 0
  players_cards[player].each do |card|
    card_name = card.match(/^\w+/)[0]
    value = VALUES[card_name.to_sym]
    if card_name == "Ace" && sum > 10
      value = 1
    end
    sum += value
  end
  players_points[player] = sum
end

def add_card(players_cards, player)
  players_cards[player].push(add_unique_card(players_cards))
end

def show_added_card(players_cards, player)
  prompt("New card: #{players_cards[player].last}")
end

def busted?(players_points)
  players_points.values.find { |v| v > 21 }
end

def who_busted?(players_points, busted)
  players_points.find { |_, v| v == busted }
end

def twenty_one?(players_points, player)
  players_points[player] == 21
end

def find_winner(players_points)
  if busted?(players_points)
    return (players_points.keys.find { |k| players_points[k] <= 21 }).to_s
  end
  return "Tie" if players_points[:Player] == players_points[:Dealer]
  players_points[:Player] > players_points[:Dealer] ? "Player" : "Dealer"
end

def show_winner(winner, stake)
  sleep 1
  case winner
  when "Tie" then prompt("Push!")
  when "Player" then prompt("You won! You won $#{stake}")
  when "Dealer" then prompt("You lost! You lost $#{stake}")
  end
  sleep 1
end

def update_bankroll(bankroll, stake, winner)
  case winner
  when "Player" then bankroll += stake
  when "Dealer" then bankroll -= stake
  end
  bankroll
end

def show_bankroll(bankroll)
  puts "Your actual bankroll is $#{bankroll}"
  sleep 2
end

def check_bankroll?(bankroll)
  bankroll.zero?
end

def invalid_integer_input?(integer)
  integer.match(/^[1-9]\d*$/).nil?
end

def invalid_stake_amount?(stake, bankroll)
  bankroll < stake
end

def stake_invalid?(stake, bankroll)
  if invalid_integer_input?(stake)
    puts "Please use only positive integers"
    return true
  end
  if invalid_stake_amount?(stake.to_i, bankroll)
    puts "Stake cannot be higher than the bankroll"
    return true
  end
  false
end

def player_turn_beginning(players_cards, players_points)
  sleep 1
  prompt("Player turn")
  sleep 1

  sum_points(players_cards, players_points, :Player)
  show_dealer_hand(players_cards)
  show_all_cards(players_cards, :Player)
  show_points(players_points, :Player)
  sleep 1
end

def dealer_turn_beginning(players_cards, players_points)
  sleep 1.5
  prompt("Dealer's turn")
  sleep 1.5

  sum_points(players_cards, players_points, :Dealer)
  show_all_cards(players_cards, :Dealer)
  show_points(players_points, :Dealer)
end

def dealing_card(players_cards, players_points, player)
  sleep 1.5
  add_card(players_cards, player)
  show_added_card(players_cards, player)
  sum_points(players_cards, players_points, player)

  if busted?(players_points)
    sleep 1
    busted = who_busted?(players_points, busted?(players_points))[0].to_s
    puts "#{busted} busted!"
  end

  sleep 1.5
  show_all_cards(players_cards, player)
  show_points(players_points, player)
end

def valid_decision?(option_1, option_2, answer, invalid)
  [option_1, option_2].include?(answer) ? true : puts(invalid)
end

def getting_answer(prompt, option_1, option_2, invalid=INVALID)
  answer = ''
  loop do
    prompt(prompt)
    answer = gets.chomp.downcase
    next unless valid_decision?(option_1, option_2, answer, invalid)
    break
  end
  answer
end

def hit_or_stay?
  prompt = "Hit or stay?"
  decision = getting_answer(prompt, 'hit', 'stay')
  decision == "stay"
end

def continue?
  prompt = "Continue? (y or n)"
  answer = getting_answer(prompt, 'y', 'n')
  answer == 'y'
end

def increase_bankroll
  prompt = "Would you like to start the game again. Press y if you would"\
          " like to, press n if you want to quit"
  next_loop = getting_answer(prompt, 'y', 'n')
  next_loop == 'y'
end

loop do
  system 'clear' || system(cls)
  prompt("Welcome to 21!")
  answer = ''
  loop do
    prompt("What's your bankroll in $?")
    answer = gets.chomp
    break unless invalid_integer_input?(answer)
    puts "Please use only positive integers"
  end
  bankroll = answer.to_i
  show_bankroll(bankroll)
  next_loop = false

  loop do
    system 'clear' || system(cls)
    players_cards = first_shuffle
    players_points = { Player: 0, Dealer: 0 }
    stake = 0
    loop do
      prompt("How much $ at stake?")
      stake = gets.chomp
      next if stake_invalid?(stake, bankroll)
      stake = stake.to_i
      break
    end

    loop do
      player_turn_beginning(players_cards, players_points)
      break if twenty_one?(players_points, :Player)

      loop do
        break if hit_or_stay?
        dealing_card(players_cards, players_points, :Player)
        break if busted?(players_points) || twenty_one?(players_points, :Player)
      end
      break
    end

    loop do
      break if busted?(players_points)
      dealer_turn_beginning(players_cards, players_points)
      break if twenty_one?(players_points, :Dealer)

      loop do
        break if (17..20).cover?(players_points[:Dealer]) ||
                 twenty_one?(players_points, :Dealer) || busted?(players_points)

        dealing_card(players_cards, players_points, :Dealer)
      end
      break
    end

    winner = find_winner(players_points)
    show_winner(winner, stake)

    bankroll = update_bankroll(bankroll, stake, winner)
    show_bankroll(bankroll)
    if check_bankroll?(bankroll)
      puts "Your bankroll is $0. You lost all of your money"
      sleep 1
      next_loop = increase_bankroll
      break
    end
    break unless continue?
  end
  next if next_loop
  break
end

prompt("Thank you for playing 21!")
