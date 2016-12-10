class CircularBuffer
  PATTERN = /^[1-8AB]$/
  A_B_PATTERN = /^[AB]$/

  class BufferEmptyException < Exception; end
  class BufferFullException < Exception; end

  def initialize(buffer_limit)
    @buffer_limit = buffer_limit
    @buffer = []
  end

  def write(number)
    full? ? raise(BufferFullException) : @buffer << number if number =~ PATTERN
  end

  def write!(sign)
    if sign =~ A_B_PATTERN
      read 
      write(sign)
    elsif sign =~ PATTERN && @buffer.length < @buffer_limit
      write(sign)
    end
  end

  def read
    @buffer.shift || raise(BufferEmptyException)
  end

  def clear
    @buffer.clear
  end

  private

  def full?
    @buffer.length == @buffer_limit
  end
end