require 'pry'
SUITS = %w(H D S C).freeze
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
POINTS_LIMIT = 21.freeze


def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def initial_deal(deck)
  deck.sample(2)
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += case value
           when 'A' then 11
           when 'J', 'Q', 'K' then 10
           else value.to_i
           end
  end

  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > POINTS_LIMIT
  end

  sum
end

def busted?(cards)
  total(cards) > POINTS_LIMIT
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > POINTS_LIMIT
    :player_busted
  elsif dealer_total > POINTS_LIMIT
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
  when :player_busted then prompt "You busted! Dealer wins!"
  when :dealer_busted then prompt "Dealer busted! You win!"
  when :player then prompt "You win!"
  when :dealer then prompt "Dealer wins!"
  when :tie then prompt "It's a tie!"
  end
end

def play_again?
  answer = ''
  loop do
    prompt "Do you want to play again? (y or n)"
    answer = gets.chomp.downcase
    break if ['y', 'n'].include?(answer[0])
    prompt "That't not a valid input"
  end
  answer.start_with?('y')
end

def display_cards(cards, connector)
  cards.map { |card| card.join(" ") }.join(connector)
end

def display_round_results(player_cards, players_points, dealer_cards)
  puts "====================        Round summary:        ===================="
  display_result(dealer_cards, player_cards)
  puts "======================================================================"
  prompt "Dealer has #{display_cards(dealer_cards, ", ")} for a total of: #{total(dealer_cards)}"
  prompt "Player has #{display_cards(player_cards, ", ")} for a total of: #{total(player_cards)}"
  puts "======================================================================"
  prompt("Player: #{players_points[:player]} points, Dealer: "\
        "#{players_points[:dealer]} points")
  puts "======================================================================"
end

def update_points!(players_points, result)
  case result
  when :dealer_busted, :player then players_points[:player] += 1
  when :player_busted, :dealer then players_points[:dealer] += 1
  end
end

def final_winner(players_points)
  players_points.find{|_,v| v == 5}
end

def display_final_winner(winner)
  puts "======================================================================"
  prompt("#{winner[0].capitalize} won the game!")
  puts "======================================================================"
end

system 'clear' || system('cls')

loop do
  prompt "Welcome to Twenty-One!"
  prompt "We play to five wins!"
  puts "======================================================================"
  players_points = {player: 0, dealer: 0}

  loop do
    deck = initialize_deck
    player_cards = initial_deal(deck)
    dealer_cards = initial_deal(deck)

    prompt "Dealer has #{dealer_cards[0].join(" ")} and ?"
    prompt "You have: #{display_cards(player_cards, " and ")}"\
           " for a total of #{total(player_cards)}."

    loop do
      player_turn = nil
      loop do
        prompt "Would you like to (h)it or (s)tay?"
        player_turn = gets.chomp.downcase
        break if ['h', 's'].include?(player_turn)
        prompt "Sorry, must enter 'h' or 's'."
      end

      if player_turn == 'h'
        player_cards << deck.pop
        prompt "You chose to hit!"
        prompt "Your cards are now: #{display_cards(player_cards, ", ")}"
        prompt "Your total is now: #{total(player_cards)}"
      end

      break if player_turn == 's' || busted?(player_cards)
    end

    prompt "You stayed at #{total(player_cards)}" unless busted?(player_cards)
    prompt "Dealer turn..."

    loop do
      break if busted?(dealer_cards) || 
               total(dealer_cards) >= (POINTS_LIMIT-4) || busted?(player_cards)
      prompt "Dealer hits!"
      dealer_cards << deck.pop
      prompt "Dealer's cards are now: #{display_cards(player_cards, ", ")}"
    end

    prompt "Dealer stays at #{total(dealer_cards)}" unless busted?(dealer_cards)

    update_points!(players_points, detect_result(dealer_cards, player_cards))
    display_round_results(player_cards, players_points, dealer_cards)
    sleep 4
    system 'clear' || system('cls')
    break if final_winner(players_points)
  end
  display_final_winner(final_winner(players_points))
  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"
