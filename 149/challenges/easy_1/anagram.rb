class Anagram
  def initialize(anagram)
    @anagram = anagram.downcase
  end

  def match(array_of_words)
    @sorted_anagram = sorted_word(@anagram)
    array_of_words
      .map { |word| word_and_sorted_word_array(word) }
      .select { |word| select_array_with_anagrams(word) }
      .map { |word| anagram_word(word) }.sort
  end

  private

  def sorted_word(word)
    word.downcase.chars.sort.join
  end

  def word_and_sorted_word_array(word)
    [word, sorted_word(word)]
  end

  def select_array_with_anagrams(word)
    word[1] == @sorted_anagram && word[0].downcase != @anagram
  end

  def anagram_word(word)
    word[0]
  end
end