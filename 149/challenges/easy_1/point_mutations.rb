class DNA
  def initialize(dna_sequence)
    @dna_sequence = dna_sequence
  end

  def hamming_distance(mutated_dna)
    @mutated_dna = mutated_dna
    (0...min_length).inject(0) { |sum, i| equal_dna?(i) ? sum : sum += 1 }
  end

  private

  def min_length
    [@mutated_dna.length, @dna_sequence.length].min
  end

  def equal_dna?(i)
    @dna_sequence[i].eql?(@mutated_dna[i])
  end
end