names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift until names.empty?
  break
end