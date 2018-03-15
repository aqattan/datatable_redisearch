class Person < ApplicationRecord
  include RediSearchRails
  validates_presence_of  :first_name, :last_name, :ssn, :date_of_birth, :address1, :address2, :city, :state, :postal_code, :phone_number, :account_number
  redi_search_schema first_name: 'TEXT', last_name: 'TEXT', ssn: 'NUMERIC', date_of_birth: 'TEXT', address1: 'TEXT', address2: 'TEXT',
                    city: 'TEXT', state: 'TEXT', postal_code: 'TEXT', phone_number: 'TEXT', account_number: 'TEXT'

  after_save do |person|
    Person.ft_sugadd(attribute: 'first_name', record: person)
    Person.ft_sugadd(attribute: 'last_name', record: person)
    Person.ft_sugadd(attribute: 'ssn', record: person)
    Person.ft_sugadd(attribute: 'date_of_birth', record: person)
    Person.ft_sugadd(attribute: 'address1', record: person)
    Person.ft_sugadd(attribute: 'address2', record: person)
    Person.ft_sugadd(attribute: 'city', record: person)
    Person.ft_sugadd(attribute: 'state', record: person)
    Person.ft_sugadd(attribute: 'postal_code', record: person)
    Person.ft_sugadd(attribute: 'phone_number', record: person)
    Person.ft_sugadd(attribute: 'account_number', record: person)
  end
end
