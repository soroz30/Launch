#question 9

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.assoc("Barney")
#=> ["Barney", 2]

#question 10

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
 Hash[*flintstones]
 #{"Fred"=>"Barney", "Wilma"=>"Betty", "Pebbles"=>"BamBam"} 
