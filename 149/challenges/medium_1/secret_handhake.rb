class SecretHandshake
  HANDSHAKES = %w(jump close\ your\ eyes double\ blink wink)

  def initialize(number)
    @binary_number = number.class == Fixnum ? number.to_s(2).to_i : number.to_i
  end

  def commands
    handshake_array = []
    reversed_array if @binary_number.to_s.length > 4
    [1000, 100, 10, 1].each_with_index do |i, index|
      next if (@binary_number / i).zero?
      @binary_number -= i
      handshake_array.unshift(HANDSHAKES[index])
    end
    @reversed ? handshake_array.reverse : handshake_array
  end

  private

  def reversed_array
    @reversed = true
    @binary_number -= 10000
  end
end