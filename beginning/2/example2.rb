def prefix(str)
  str << Time.now.to_s
  "Mr." + str
end

name = 'joe'
prefix(name)

puts name