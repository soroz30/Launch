def anagram (array)
  newarray = []
  array.each do |arr|
    a = arr.chars.sort 
    newarray.push(a)
  end
  i = 0
  indexlist = []

  while i < newarray.length
    val = newarray[i]
    if newarray.count(val) > 1
      index = []
      j = 0
      newarray.each do |ele|
        if ele == val
          index.push(j)
        end
        j += 1
      end
      indexlist.push(index)
    end
    i += 1
  end
  indexlist.uniq!

  indexlist.each do |ele|
    err = []
    ele.each do |al|
      err.push(array[al])
    end 
    p err
  end  
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagram(words)