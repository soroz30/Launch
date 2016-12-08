require 'pry'

class Phrase
  SPLIT_PATTERN = /[ ,]|\s/

  def initialize(sentence)
    @sentence = exclude_words_from_string(sentence)
    @unique_words = @sentence.uniq
  end

  def word_count
    counts_hash = Hash.new
    @unique_words.each do |word|
      counts_hash[word] = @sentence.count(word)
    end
    counts_hash
  end

  private

  def exclude_words_from_string(sentence)
    sentence
      .downcase
      .split(SPLIT_PATTERN)
      .map { |word| select_words(word ) }
      .compact
  end

  def select_words(word)
    word = word.scan(/[a-z0-9']+/i)[0]
    return nil if word.nil?
    word.match(/'\w+'/) ? word.match(/'(\w+)'/)[1] : word
  end
end