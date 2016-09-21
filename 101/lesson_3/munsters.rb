munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


munsters.each do |key, value|
  age = value["age"]
  case age 
    when (0..17)
      munsters[key]["adult_age"] = "kid"
    when (18..64)
      munsters[key]["adult_age"] = "adult"
    else
      munsters[key]["adult_age"] = "senior"
  end

end

p munsters