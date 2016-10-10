require 'pry'

def balanced?(string)
  string.sub!(/\((.+?)\)/, '\1') while string.match(/\((.+?)\)/)
  string.count("()") == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false


# def letter_percentages(string)
#   counts = { lowercase: 0, uppercase: 0, neither: 0 }
#   percentages = { lowercase: [], uppercase: [], neither: [] }
#   characters = string.chars
#   length = string.length

#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

#   calculate(percentages, counts, length)

#   percentages
# end

# def calculate(percentages, counts, length)
#   percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
#   percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
#   percentages[:neither] = (counts[:neither] / length.to_f) * 100
# end




# def letter_case_count(string)
#   counts = {}
#   characters = string.chars
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
#   counts
# end

# def letter_percentages(string)
#   length = string.split('').length
#   case_count = letter_case_count(string)
#   num_of_chars = case_count.values.inject(:+)
#   case_count.map { |k, v| case_count[k] = sprintf("%g", v.to_f*100/num_of_chars)}
#   case_count
# end

# puts letter_percentages('abCdef 123')
# puts letter_percentages('AbCd +Ef')
# puts letter_percentages('123')




# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(word)
#   BLOCKS.select {|b| (word.chars & b.chars).size >= 2}.empty?
# end




# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(string)
#   up_string = string.upcase
#   BLOCKS.none? { |block| up_string.count(block) >= 2 }
# end

# p block_word?("batch")

# BLOCKS = Array('B'=>'O', 'X'=>'K', 'D'=>'Q', 'C'=>'P', 
#               'N'=>'A', 'G'=>'T', 'R'=>'E', 'F'=>'S',
#               'J'=>'W', 'H'=>'U', 'V'=>'I', 'L'=>'Y',
#               'Z'=>'M').freeze

# def block_word?(string)
#   BLOCKS.each { |block| return false if block.all? {|i| string.include?(i)}  }
#   true
# end

# p block_word?('BATCH')
# p block_word?('BUTCH')
# p block_word?('jest')



# a = "Four score and seven years ago our fathers brought forth
# on this continent a new nation, conceived in liberty, and
# dedicated to the proposition that all men are created
# equal.

# Now we are engaged in a great civil war, testing whether
# that nation, or any nation so conceived and so dedicated,
# can long endure. 'We are met on a great battlefield of that
# war. We have come to dedicate a portion of that field, as
# a final resting place for those who here gave their lives
# that that nation might live.' It is altogether fitting and
# proper that we should do this.

# But, in a larger sense, we can not dedicate, we can not
# consecrate, we can not hallow this ground. 'The brave
# men, living and dead, who struggled here, have
# consecrated it, far above our poor power to add or
# detract.' The world will little note, nor long remember
# what we say here, but it can never forget what they
# did here. It is for us the living, rather, to be dedicated
# here to the unfinished work which they who fought
# here have thus far so nobly advanced. 'It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth.'".split(/\.|\?|!/).max_by { |sentence| sentence.split.size}.strip.split.size

# puts a