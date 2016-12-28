require 'pry'

class Bst
  attr_reader :data
  attr_accessor :left, :right

  def initialize(number)
    @data = number
  end

  def insert(number)
    if number <= data
      self.left.nil? ? self.left = Bst.new(number) : self.left.insert(number)
    else
      self.right.nil? ? self.right = Bst.new(number) : self.right.insert(number)
    end
  end

  def each(&block)
    return to_enum(:each) unless block_given?

    left.each(&block) if left
    block.call(data)
    right.each(&block) if right
  end
end