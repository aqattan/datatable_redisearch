json.extract! person, :id, :first_name, :last_name, :ssn, :date_of_birth, :address1, :address2, :city, :state, :postal_code, :phone_number, :account_number, :created_at, :updated_at
json.url person_url(person, format: :json)
