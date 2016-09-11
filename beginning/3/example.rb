#jak value w hashu moze byc nil sprawdzaj przez fetch
2.2.1 :004 > hsh['a']
 => nil 
2.2.1 :005 > hsh.fetch('a')
KeyError: key not found: "a"
  from (irb):5:in `fetch'
  from (irb):5
  from /home/oses32/.rvm/rubies/ruby-2.2.1/bin/irb:11:in `<main>'


#select returns a new array based on the block's return value. It it evaluates to true, then the element is selected
#map returns a new array based on the block's return value. Each element is transformed based on the return value

# tu w arrayu sie zmieni poniewaz << jest pointerem
# arr << hsh
# shs[:f] = 6