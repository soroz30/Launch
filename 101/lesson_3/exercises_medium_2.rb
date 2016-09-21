#question 1

munsters.keys.select {|key| munsters[key]["gender"] == "male"}
                        .map {|i| munsters[i]["age"]}.inject(:+)

total_male_age = 0
munsters.each do |name, details|
  total_male_age += details["age"] if details["gender"] == "male"
end

#question 2

munsters.each_pair do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end

#question 4
words = sentence.split(/\W/)
words.reverse!
backwards_sentence = words.join(' ') + '.'

