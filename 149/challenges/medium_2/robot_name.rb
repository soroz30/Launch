class Robot
  attr_reader :name
  @@robots_names = []

  def initialize
    reset
  end

  def create_random_name
    name_array = nil
    loop do
      name_array = []
      2.times do name_array << random_letter end
      3.times do name_array << random_number end
      name_array  = name_array.join
      break unless @@robots_names.include? (name_array)
    end
    @@robots_names << name_array
    name_array
  end

  def reset
    @name = create_random_name
  end

  private

  def random_number
    rand(10).to_s
  end

  def random_letter
    rand(65..90).chr
  end
end