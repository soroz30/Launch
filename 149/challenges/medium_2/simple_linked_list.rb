class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :size, :head

  def initialize
    @size = 0
  end

  def empty?
    @size == 0
  end

  def push(datum)
    element = Element.new(datum, @head)
    @head = element
    @size += 1
  end

  def peek
    @head.datum if @head
  end

  def pop
    datum = peek
    new_head = @head.next
    @head = new_head
    @size -= 1
    datum 
  end

  def self.from_a(array)
    array = [] if array.nil?
    dupe_array = array.dup

    list = SimpleLinkedList.new
    list.push(dupe_array.pop) while (!dupe_array.empty?)
    list
  end

  def to_a
    array = []
    array.push(pop) while !empty
    array
  end

  def reverse
    list = SimpleLinkedList.new
    list.push(pop) while (!empty?)
    list
  end
end