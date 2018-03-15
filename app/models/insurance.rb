class Insurance < ApplicationRecord
  include RediSearchRails
  validates_presence_of :name, :address1, :address2, :city, :state, :postal_code
  redi_search_schema name: 'TEXT', address1: 'TEXT', address2: 'TEXT', city: 'TEXT', state: 'TEXT', postal_code: 'TEXT'

  after_save do |insurance|
    Insurance.ft_sugadd(attribute: 'name', record: insurance)
    Insurance.ft_sugadd(attribute: 'address1', record: insurance)
    Insurance.ft_sugadd(attribute: 'address2', record: insurance)
    Insurance.ft_sugadd(attribute: 'city', record: insurance)
    Insurance.ft_sugadd(attribute: 'state', record: insurance)
    Insurance.ft_sugadd(attribute: 'postal_code', record: insurance)
  end
end
