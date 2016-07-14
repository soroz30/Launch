contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]

contacts = {"Joe Smith" => {}}

ok = [:email, :address, :phone]

def move(contact_data, contacts, ok)

  i = 0
  ok.each do |ele|
    contacts["Joe Smith"][ele] = contact_data[i]
    i += 1
  end

end

move(contact_data, contacts, ok)

p contacts

#albo

contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
fields = [:email, :address, :phone]

contacts.each do |name, hash|
  fields.each do |field|
    hash[field] = contact_data.shift
  end
end