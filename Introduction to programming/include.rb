arr = [1, 3, 5, 7, 9, 11]
number = 12

def inc(arr, number)
  bool = false
  if arr.include? number
    bool = true
  end
  p bool
end

inc(arr, number)