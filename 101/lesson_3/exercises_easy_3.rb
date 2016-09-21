#question 1
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#question 2
flintstones << "Dino"

#question 3
flintstones.push("Dino").push("Hoppy")
flintstones.concat(%w(Dino Hoppy))
flintstones.insert(0, "Gosia", "Ania")

#question 4
advice.slice!(/^.+(?=house)/)
advice.slice!(/house.+$/)
advice.slice!(0, advice.index('house'))

#question 5
statement.count("t")
statement.scan('t').count

#question 6
title.center(40)