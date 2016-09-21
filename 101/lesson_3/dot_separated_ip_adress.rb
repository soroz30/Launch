def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.match(/^\d+\.\d+\.\d+\.\d+$/)
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false if !is_an_ip_number?(word)
  end
  true
end