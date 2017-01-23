class Cipher
  LETTERS = ('a'..'z').to_a

  attr_accessor :key

  def initialize(key=nil)
    @key = key.nil? ? generate_random_key : check_key(key)  
  end

  def encode(text)
    text.chars.map.with_index do |letter, i|
      LETTERS[(LETTERS.index(letter) + calculate_key[i]) % LETTERS.length]
    end.join
  end

  def decode(text)
    text.chars.map.with_index do |letter, i|
      LETTERS[LETTERS.index(letter) - calculate_key[i]]
    end.join
  end

  private

  def generate_random_key
    (0...100).map { |i| LETTERS.sample }.join
  end

  def check_key(key)
    raise ArgumentError('Use only a-z') unless key =~ /\A[a-z]+\z/
    key
  end

  def calculate_key
    key.chars.map { |letter| LETTERS.index(letter) }
  end
end