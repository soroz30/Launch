module Interface
  def prompt(message)
    puts "=> #{message}"
  end

  def line
    puts "-" * 51
  end

  def clear_display
    system('clear') || system('cls')
  end
end

class Choice
  attr_accessor :name
end

class Rock < Choice
  def initialize
    @name = "rock"
  end

  def beats?(other_move)
    other_move.class == Scissors ||
      other_move.class == Lizard
  end
end

class Paper < Choice
  def initialize
    @name = "paper"
  end

  def beats?(other_move)
    other_move.class == Rock ||
      other_move.class == Spock
  end
end

class Scissors < Choice
  def initialize
    @name = "scissors"
  end

  def beats?(other_move)
    other_move.class == Paper ||
      other_move.class == Lizard
  end
end

class Lizard < Choice
  def initialize
    @name = "lizard"
  end

  def beats?(other_move)
    other_move.class == Paper ||
      other_move.class == Spock
  end
end

class Spock < Choice
  def initialize
    @name = "spock"
  end

  def beats?(other_move)
    other_move.class == Rock ||
      other_move.class == Scissors
  end
end

class Move
  attr_accessor :value, :name
  VALUES = {
    'rock' => Rock.new,
    'paper' => Paper.new,
    'scissors' => Scissors.new,
    'lizard' => Lizard.new,
    'spock' => Spock.new
  }.freeze

  def initialize(value)
    @value = VALUES[value]
  end

  def >(other_move)
    @value.beats?(other_move.value)
  end

  def <(other_move)
    other_move.value.beats?(@value)
  end

  def name
    @value.name
  end
end

class Player
  include Interface
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def choose
    choice = nil
    loop do
      prompt "Choose - r: rock, p: paper, sc: scissors, l: lizard, sp: spock"
      choice = gets.chomp.downcase
      break if choice =~ /^([a-rt-z]|s[cp])$/
      prompt "Sorry, invalid choice."
    end
    choice = Move::VALUES.keys.find { |k| k.match(/#{choice}/) }
    @move = Move.new(choice)
  end

  private

  def set_name
    n = ''
    loop do
      prompt "What's your name?"
      n = gets.chomp
      break unless n.empty?
      prompt "Sorry, must enter a value."
    end
    @name = n
  end
end

class Computer < Player
  def choose(decision)
    @move = if decision
              Move.new(decision)
            elsif Personalities::LIST.include? @name
              name = @name == 'Number 5' ? 'number_5' : @name.downcase
              Move.new(Personalities.new.send(name))
            else
              Move.new(Move::VALUES.keys.sample)
            end
  end

  private

  def set_name
    @name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end
end

class Personalities
  LIST = ['Hal', 'R2D2', 'Number 5'].freeze

  def hal
    "rock"
  end

  def r2d2
    case rand(1..10)
    when (1..8) then "scissors"
    when (9..10) then "rock"
    end
  end

  def number_5
    Move::VALUES.keys.select { |m| m.length == 5 }.sample
  end
end

class Score
  attr_accessor :points
  def initialize
    @points = { human: 0, computer: 0 }
  end

  def update(result)
    result == :human ? points[:human] += 1 : points[:computer] += 1
  end

  def to_s
    "Player: #{points[:human]} points, Computer: #{points[:computer]} points"
  end
end

class History
  attr_accessor :moves_record
  def initialize
    @moves_record = { human: Hash.new(0), computer: Hash.new(0) }
  end

  def decision_analysis
    human_record = moves_record[:human]
    number_of_moves = human_record.values.inject(:+)
    selected = human_record.find { |_, v| (v * 100 / number_of_moves) >= 60 }
    return false if selected.nil? || selected[1] < 3
    Move::VALUES.values.find { |v| v.beats?(Move::VALUES[selected[0]]) }.name
  end
end

class RPSGame
  include Interface
  attr_accessor :human, :computer, :score, :history, :winner, :limit

  def initialize
    display_welcome_message
    @human = Human.new
    @computer = Computer.new
    @score = Score.new
    @history = History.new
  end

  def round_result
    if human.move > computer.move
      :human
    elsif human.move < computer.move
      :computer
    else
      :tie
    end
  end

  def update_points
    case round_result
    when :human then score.update(:human)
    when :computer then score.update(:computer)
    end
  end

  def update_history
    history.moves_record[:human][human.move.name] += 1
    history.moves_record[:computer][computer.move.name] += 1
  end

  def points_limit
    points_limit = nil
    loop do
      prompt("How many points to win?")
      points_limit = gets.chomp
      break if points_limit =~ /^[1-9]\d*$/
      prompt("Sorry, must be a whole number")
    end
    points_limit.to_i
  end

  def game_rounds
    @limit = points_limit
    display_points_limit
  end

  def players_chooses
    human.choose
    computer.choose(history.decision_analysis)
  end

  def update_data
    update_points
    update_history
  end

  def display_data
    display_moves
    display_winner
    display_points
  end

  def final_winner
    @score.points.select { |_, v| v == limit }.keys[0]
  end

  def reset_data
    @history = History.new
    @score = Score.new
  end

  def display_welcome_message
    clear_display
    puts line
    prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
    puts ''
    puts line
  end

  def display_goodbye_message
    prompt("Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!")
  end

  def display_winner
    case round_result
    when :human then prompt("#{human.name} won!")
    when :computer then prompt("#{computer.name} won!")
    when :tie then prompt("It's a tie!")
    end
  end

  def display_points
    prompt(score.to_s)
    sleep 2
  end

  def display_moves
    prompt("#{human.name} chose #{human.move.name}.")
    prompt("#{computer.name} chose #{computer.move.name}.")
    sleep 1
  end

  def display_final_winner
    final_winner == :human ? @winner = human.name : @winner = computer.name
    prompt("The final winner is #{winner}!")
  end

  def display_points_limit
    prompt("We play to #{limit} wins")
    sleep 2
    clear_display
  end

  def game_over?
    @score.points.values.any? { |p| p == limit }
  end

  def play_again?
    answer = nil
    loop do
      prompt("Would you like to play again? (y/n)")
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      prompt("Sorry, must be y or n.")
    end
    answer == 'y'
  end

  def play
    loop do
      game_rounds
      loop do
        players_chooses
        update_data
        display_data
        break if final_winner
        clear_display
      end
      display_final_winner
      break unless play_again?
      reset_data
      clear_display
    end
    display_goodbye_message
  end
end

RPSGame.new.play
