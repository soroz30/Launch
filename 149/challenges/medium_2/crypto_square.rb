class Crypto
  attr_reader :string
  def initialize(string)
      @string = string
    end

    def normalize_plaintext
      string.gsub(/[^\w\d]/,"").downcase
    end

    def size
      Math.sqrt(normalize_plaintext.length).ceil
    end

    def plaintext_segments
      normalize_plaintext.scan(/.{1,#{size}}/)
    end

    def transposed_rows
      chunked_text = plaintext_segments.map{|row| row.split("")}
      chunked_text.last.push(nil) until chunked_text.last.length == size
      chunked_text.transpose
    end

    def ciphertext
      transposed_rows.join
    end

    def normalize_ciphertext
      transposed_rows.map{|row| row.join}.join(" ")
    end
end