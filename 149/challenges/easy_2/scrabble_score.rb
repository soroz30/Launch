class Scrabble
  LETTER_SCORE = {
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V M Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
  }

  def initialize(word)
    @word = word
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    return 0 if @word.class != String
    calculate_score(@word.chars)
  end

  private

  def calculate_score(chars)
    chars.inject(0) { |sum, chr| sum += calculate_points(chr) }
  end

  def calculate_points(chr)
    LETTER_SCORE.each { |k, v| return v if k.include? chr.upcase }
    0
  end
end