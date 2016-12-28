require 'pry'

class House

  def self.recite
    recite = ''
    (1..12).each do |i|
      recite += use_pieces(i) + "\n"
    end
    recite.chomp
  end

  def self.use_pieces(n)
    House.new.take_pieces(n)
  end

  def take_pieces(n)
    pieces_for_recite = "This is " + pieces[-n][0] + "\n"
    pieces_for_recite += (n-1).downto(1).map do |i| 
      pieces[-(i+1)][1] + " " + pieces[-i][0] + "\n"
    end.join
    pieces_for_recite.chomp + ".\n"
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end