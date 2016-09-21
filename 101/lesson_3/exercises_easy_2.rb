#question 1
ages.has_key?("Spot")
ages.fetch("Spot")
ages.include?("Spot")
ages.member?("Spot")

#question 2
ages.values.inject(:+)

#question 3
ages.select {|key, value| value < 100}
ages.keep_if { |_, age| age < 100 }

#question 4
munsters_description.capitalize!
munsters_description.swapcase!
munsters_description.downcase!
munsters_description.upcase!

#question 5
ages.merge!(additional_ages)

#question 6
ages.values.min

#question 7
advice.match("Dino")
advice.include?("Dino")

#question 8
flintstones.index { |name| name[0, 2] == "Be" }

#question 9
flintstones.map! do |name|
  name[0, 3]
end
flintstones.map! {|ele| ele[0..2]}

#question 10
