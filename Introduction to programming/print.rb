hash = {imie: "Martyna", nazwisko: "Koziolek", wiek: 25}

def printhash(hash)
  hash.each {|k, v| puts v, k}
end

printhash(hash)