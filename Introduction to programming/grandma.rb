puts "Ask Gradnma a question: "
question = gets.chomp
quest = question
counter = 3

while question != "BYE"
  if quest != quest.upcase
    puts "huh?"
    quest = gets.chomp
    counter = 3
  else
    if counter > 0 and quest == "BYE"
       counter = counter - 1
       puts 'bye?'
       if counter == 0 and quest == "BYE"
        puts 'koniec'
        question = quest
       else
        quest = gets.chomp
       end  
    else
      counter = 3
      random = 1930 + rand(20)
      puts "No! it was in " + random.to_s
      quest = gets.chomp
    end
  end
end

