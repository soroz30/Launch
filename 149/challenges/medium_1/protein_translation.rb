class Translation
  PROTEINS = {
    'Methionine' => %w(AUG),
    'Phenylalanine' => %w(UUU UUC),
    'Leucine' => %w(UUA UUG),
    'Serine' => %w(UCU UCC UCA UCG),
    'Tyrosine' => %w(UAU UAC),
    'Cysteine' => %w(UGU UGC),
    'Tryptophan' => %w(UGG),
    'STOP' => %w(UAA UAG UGA)
  }

  def self.of_codon(codon)
    PROTEINS.select{ |_, c| c.include? (codon) }.keys[0]
  end

  def self.of_rna(rna)
    proteins_of_rna = []
    codons_array = create_codons_from_array(rna)
    raise InvalidCodonError unless validate_codons(codons_array)
    codons_array.each do |codon|
      protein = of_codon(codon)
      break if protein == 'STOP'
      proteins_of_rna << protein
    end
    proteins_of_rna
  end

  private

  def self.create_codons_from_array(rna)
    rna.chars.each_slice(3).map { |codon| codon.join }
  end

  def self.validate_codons(codons_array)
    codons_array.all? do |codon| 
      PROTEINS.values.find { |v| v.include? (codon) }
    end
  end
end