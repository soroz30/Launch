class School
  def initialize
    @list = Hash.new { |roster, grade| roster[grade] = [] }
  end

  def to_h
    @list.sort.map { |grade, list| [grade, list.sort] }.to_h
  end

  def add(student, grade)
    @list[grade] << student
  end

  def grade(number)
    @list[number]
  end
end