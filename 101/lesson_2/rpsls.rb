CHOICES_LIST = { "r" => "rock",
                 "p" => "paper",
                 "sc" => "scissors",
                 "l" => "lizard",
                 "sp" => "spock" }
WINNING_COMBINATIONS = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(spock paper),
  'spock' => %w(scissors rock)
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_choice?(choice)
  CHOICES_LIST.keys.include?(choice)
end

def display_choice_options
  player_options = []
  CHOICES_LIST.each { |key, value| player_options.push("#{key} = #{value}") }
  player_options.join(', ')
end

def choice_full_name(choice)
  CHOICES_LIST[choice]
end

def win?(first, second)
  WINNING_COMBINATIONS[first].include?(second)
end

def round_winner(player, computer)
  if win?(player, computer)
    "Player"
  elsif win?(computer, player)
    "Computer"
  else
    "Tie"
  end
end

def update_points(winning_player, players_points)
  if winning_player == "Player"
    players_points["Player"] += 1
  elsif winning_player == "Computer"
    players_points["Computer"] += 1
  end
end

def end_game?(players_points)
  players_points.values.include?(5)
end

def display_round_results(winning_player)
  if winning_player == "Player"
    prompt("Player won the round!")
  elsif winning_player == "Computer"
    prompt("Computer won the round!")
  else
    prompt("Tie!")
  end
end

def display_points(players_points)
  prompt("Player: #{players_points['Player']} points, " \
         "Computer: #{players_points['Computer']} points")
end

def display_winner(players_points)
  if players_points["Player"] == 5
    prompt("Player won the game!")
  else
    prompt("Computer won the game!")
  end
end

def clear_display
  sleep 1.5
  system('clear')
end

def valid_exit_answer?(answer)
  return false if answer.empty?()
  %w(y n).include?(answer[0])
end

loop do
  players_points = { "Player" => 0, "Computer" => 0 }

  loop do
    choice = ''
    loop do
      prompt("Choose one: #{display_choice_options}")
      choice = Kernel.gets().chomp().downcase()

      if valid_choice?(choice)
        break
      else
        prompt("That's not a valid choice.")
        clear_display()
      end
    end

    choice = choice_full_name(choice)
    computer_choice = CHOICES_LIST.keys.sample
    computer_choice = choice_full_name(computer_choice)
    prompt("You chose: #{choice}, " \
          "Computer choice: #{computer_choice}")

    winning_player = round_winner(choice, computer_choice)
    update_points(winning_player, players_points)

    display_round_results(winning_player)
    display_points(players_points)

    break if end_game?(players_points)
    clear_display()
  end

  display_winner(players_points)

  prompt('Do you want to play again?' \
        ' Enter Y if you want, enter N if want to exit')
  answer = Kernel.gets().chomp().downcase()
  loop do
    if valid_exit_answer?(answer)
      break
    else
      clear_display()
      prompt("Input error. Please enter Y for playing again or N for quit")
      answer = Kernel.gets().chomp().downcase()
    end
  end

  break unless answer.start_with?('y')
end

prompt("Thank you for playing the game!")
