WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
POINTS_TO_WIN = 5
FIRST_PLAYER = 'Choose'.freeze

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, starting_player)
  system 'clear' || system(cls)
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts "#{starting_player} plays first"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimeter=', ', word='or')
  arr[-1] = " #{word} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join('') : "#{arr[0..-2].join(delimeter)}#{arr[-1]}"
end

def count_markers(line, board, marker)
  board.values_at(*line).count(marker)
end

def find_at_risk_square(line, board, marker)
  return nil unless count_markers(line, board, marker) == 2
  line.select { |num| empty_squares(board).include?(num) }[0]
end

def find_optimal_computer_move(brd, marker)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, marker)
    break if square
  end
  square
end

def computer_offense_move(brd)
  find_optimal_computer_move(brd, COMPUTER_MARKER)
end

def computer_defence_move(brd)
  find_optimal_computer_move(brd, PLAYER_MARKER)
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece "\
           "(#{joinor(empty_squares(brd), ', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = computer_offense_move(brd) ||
           computer_defence_move(brd) ||
           empty_squares(brd).select { |n| n == 5 }.first ||
           empty_squares(brd).sample

  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  player_places_piece!(brd) if current_player == "Player"
  computer_places_piece!(brd) if current_player == "Computer"
end

def alternate_player(current_player)
  current_player == "Player" ? "Computer" : "Player"
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_round_winner(brd)
end

def detect_round_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if count_markers(line, brd, PLAYER_MARKER) == 3
    return 'Computer' if count_markers(line, brd, COMPUTER_MARKER) == 3
  end
  nil
end

def end_round?(brd)
  someone_won?(brd) || board_full?(brd)
end

def update_points!(winner, players_scores)
  players_scores[winner] += 1
end

def display_points(players_scores)
  prompt("#{players_scores.keys[0]}: #{players_scores.values[0]} points,"\
  " #{players_scores.keys[1]}: #{players_scores.values[1]} points")
end

def end_game?(players_scores)
  players_scores.values.include?(POINTS_TO_WIN)
end

def display_final_winner(players_scores)
  winner = players_scores.select { |_, points| points == POINTS_TO_WIN }.keys[0]
  prompt "The final winner is #{winner}"
end

def play_again?
  answer = ''
  loop do
    prompt("Play again? (y or n)")
    answer = gets.chomp.downcase[0]
    break if ['y', 'n'].include?(answer)
    prompt('That\'s not a valid answer, please select y to play' \
          ' or n to exit')
  end
  answer == 'y'
end

loop do
  players_scores = { "Player" => 0, "Computer" => 0 }
  prompt('Welcome to Tic Tac Toe!')
  starting_player =
    case FIRST_PLAYER
    when "Player"   then "Player"
    when "Computer" then "Computer"
    when "Choose"
      prompt("Who to play first - Player or Computer?")
      answer = ''
      loop do
        answer = gets.chomp
        break if players_scores.keys.include?(answer.capitalize)
        prompt("Sorry, that's not a valid choice.")
      end
      answer
    else
      "Player"
    end

  loop do
    board = initialize_board
    current_player = starting_player

    loop do
      display_board(board, starting_player)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if end_round?(board)
    end

    display_board(board, starting_player)

    if someone_won?(board)
      prompt "#{detect_round_winner(board)} won!"
      update_points!(detect_round_winner(board), players_scores)
    else
      prompt "It's a tie!"
    end

    starting_player = alternate_player(starting_player)

    display_points(players_scores)
    sleep 1.5

    if end_game?(players_scores)
      display_final_winner(players_scores)
      break
    end
  end
  break unless play_again?
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
