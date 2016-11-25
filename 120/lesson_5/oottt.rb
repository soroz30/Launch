module UserInput
  def select_marker
    marker = nil
    loop do
      prompt("Please select your marker: type x for X, type o for O")
      marker = gets.chomp.upcase
      break if TTTGame::MARKERS.include? marker
      puts "Sorry, that's not a valid choice"
    end
    TTTGame::MARKERS.each do |mark|
      mark == marker ? human.marker = mark : computer.marker = mark
    end
  end

  def select_first_player
    answer = nil
    loop do
      prompt("Who to play first - Player or Computer?")
      answer = gets.chomp.downcase
      break if %w(player computer).include? answer
      puts "That's not a valid choice"
    end
    @starting_marker = answer == 'player' ? human.marker : computer.marker
  end

  def play_again?
    answer = nil
    loop do
      prompt("Would you like to play again? (y/n)")
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def joinor
    unmarked_list = board.unmarked_keys
    unmarked_list[-1] = " or #{unmarked_list.last}" if unmarked_list.size > 1
    case unmarked_list.size == 2
    when true then marker_logic(@current_marker)
    when false then "#{unmarked_list[0..-2].join(', ')}#{unmarked_list[-1]}"
    end
  end
end

module DisplayMessages
  def display_welcome_message
    prompt("Welcome to Tic Tac Toe!")
  end

  def display_goodbye_message
    prompt("Thanks for playing Tic Tac Toe! Goodbye!")
  end

  def display_board
    prompt("#{human.name} is #{human.marker}. #{computer.name} is "\
      "#{computer.marker}.")
    puts ""
    board.draw
    puts ""
  end

  def display_score
    prompt("#{human.name}: #{score.points[:human]} points, #{computer.name}:"\
      " #{score.points[:computer]} points.")
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def display_final_winner
    winner = score.final_winner.keys[0] == :human ? human.name : computer.name
    prompt("The final winner is #{winner}")
  end

  def display_play_again_message
    puts "Let's play again!"
    sleep 2
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_result_and_score
    display_result
    display_score
  end
end

module PlayersMoves
  def human_moves
    prompt("Choose a square (#{joinor}): ")
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    square = computer_offense_move ||
             computer_defence_move ||
             board.unmarked_keys.select { |n| n == 5 }.first ||
             board.unmarked_keys.sample

    board[square] = computer.marker
  end

  def computer_offense_move
    find_optimal_computer_move(computer.marker)
  end

  def computer_defence_move
    find_optimal_computer_move(human.marker)
  end

  def find_optimal_computer_move(marker)
    square = nil
    Board::WINNING_LINES.each do |line|
      square = find_at_risk_square(line, marker)
      break if square
    end
    square
  end

  def find_at_risk_square(line, marker)
    return nil unless board.count_markers(line, marker) == 2
    line.select { |num| board.unmarked_keys.include?(num) }[0]
  end

  def human_marker_move_and_change
    human_moves
    @current_marker = computer.marker
  end

  def computer_marker_move_and_change
    computer_moves
    @current_marker = human.marker
  end

  def move_select(marker_symbol)
    case marker_symbol == human.marker
    when true then human_marker_move_and_change
    when false then computer_marker_move_and_change
    end
  end

  def current_player_moves
    board.empty? ? move_select(@starting_marker) : move_select(@current_marker)
  end
end

module Interface
  def prompt(message)
    puts "=> #{message}"
  end

  def clear
    system "clear"
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def empty?
    unmarked_keys.length == @squares.keys.length
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if three_identical_markers?(squares)
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def count_markers(line, sign)
    @squares.values_at(*line).count { |i| i.marker == sign }
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " ".freeze

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :name
  attr_accessor :marker

  def initialize
    @name = select_name
  end
end

class Human < Player
  include Interface
  def select_name
    name = nil
    loop do
      prompt("What's your name")
      name = gets.chomp
      break if name =~ /\S+/
      puts "Please type anything"
    end
    name
  end
end

class Computer < Player
  def select_name
    ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end
end

class Score
  attr_reader :points

  MAX_SCORE = 5

  def initialize
    reset
  end

  def update_points(result)
    case result
    when :human then @points[:human] += 1
    when :computer then @points[:computer] += 1
    end
  end

  def to_s
    "Player: #{@points[:human]} points, Computer: #{@points[:computer]} points."
  end

  def final_winner
    @points.select { |_, v| v == MAX_SCORE }
  end

  def max_points?
    !final_winner.empty?
  end

  def reset
    @points = { human: 0, computer: 0 }
  end
end

class TTTGame
  include Interface, DisplayMessages, UserInput, PlayersMoves

  MARKERS = %w(X O).freeze

  attr_reader :board, :human, :computer, :score

  def initialize
    display_welcome_message
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    select_marker
    @score = Score.new
  end

  def play
    clear
    main_loop
    display_goodbye_message
  end

  private

  def main_loop
    loop do
      select_first_player
      game_loop
      display_final_winner
      break unless play_again?
      display_play_again_message
      score.reset
    end
  end

  def game_loop
    loop do
      display_board
      round_loop
      score.update_points(round_winner)
      display_result_and_score
      reset
      break if score.max_points?
    end
  end

  def round_loop
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board
    end
  end

  def round_winner
    return :human if board.winning_marker == human.marker
    return :computer if board.winning_marker == computer.marker
  end

  def reset
    sleep 2
    board.reset
    clear
  end
end

game = TTTGame.new
game.play
