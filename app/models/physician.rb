class Physician < ApplicationRecord
  include RediSearchRails
  validates_presence_of :first_name, :last_name, :npi, :address1, :address2, :city, :state, :postal_code
  redi_search_schema first_name: 'TEXT', last_name: 'TEXT', npi: 'TEXT', address1: 'TEXT', address2: 'TEXT', city: 'TEXT', state: 'TEXT', postal_code: 'TEXT'

  after_save do |ph|
    Physician.ft_sugadd(attribute: 'first_name', record: ph)
    Physician.ft_sugadd(attribute: 'last_name', record: ph)
    Physician.ft_sugadd(attribute: 'npi', record: ph)
    Physician.ft_sugadd(attribute: 'address1', record: ph)
    Physician.ft_sugadd(attribute: 'address2', record: ph)
    Physician.ft_sugadd(attribute: 'city', record: ph)
    Physician.ft_sugadd(attribute: 'state', record: ph)
    Physician.ft_sugadd(attribute: 'postal_code', record: ph)
  end
end
