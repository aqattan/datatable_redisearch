require 'faker'
1000000.times do |x|
  Person.create({first_name: "#{Faker::Name.first_name}", last_name: "#{Faker::Name.last_name}", ssn:"#{Faker::Number.number(9)}", date_of_birth: "#{Faker::Date.birthday}",
  address1: "#{Faker::Address.street_address}", address2: "#{Faker::Address.street_address}", city: "#{Faker::Address.city}", state: "#{Faker::Address.state}",
  postal_code: "#{Faker::Address.postcode}", phone_number: "#{Faker::PhoneNumber.phone_number}", account_number: "#{Faker::Number.number(12)}"})
  Insurance.create({name: "#{Faker::Company.name}", address1: "#{Faker::Address.street_address}", address2: "#{Faker::Address.street_address}", city: "#{Faker::Address.city}",
  state: "#{Faker::Address.state}", postal_code: "#{Faker::Address.postcode}"})
  Physician.create({first_name: "#{Faker::Name.first_name}", last_name: "#{Faker::Name.last_name}", npi: "#{Faker::Number.number(10)}", address1: "#{Faker::Address.street_address}",
  address2: "#{Faker::Address.street_address}", city: "#{Faker::Address.city}", state: "#{Faker::Address.state}", postal_code: "#{Faker::Address.postcode}"})
end
