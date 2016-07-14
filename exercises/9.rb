h = {a:1, b:2, c:3, d:4}

p h[:b]

p h[:e] = 5

h.delete_if {|key, value| value < 3.5}

h