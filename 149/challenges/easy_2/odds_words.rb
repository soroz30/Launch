def reverse_odd_words(sentence)
  sentence
    .sub(/(\w)(\.)/, '\1 \2')
    .split
    .map.with_index {|w,i| i.odd? ? w.reverse : w}
    .join(' ')
    .sub(/(\w)\s*(\.)\s*$/, '\1\2')
end

puts reverse_odd_words('')
puts reverse_odd_words('.')
puts reverse_odd_words('hello')
puts reverse_odd_words('hello.')
puts reverse_odd_words('hello word')
puts reverse_odd_words('hello word.')
puts reverse_odd_words('hello   word.')
puts reverse_odd_words('hello   word.  ')
puts reverse_odd_words('hello     word   .  ')
puts reverse_odd_words('hello  word      wordl . ')