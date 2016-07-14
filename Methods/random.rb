names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(names=names)
  return names.sample
end

def activity(activities=activities)
  return activities.sample
end

def sentence(name, activities)
  return name + " went " + activities + " today!"
end

puts sentence(name(names), activity(activities))