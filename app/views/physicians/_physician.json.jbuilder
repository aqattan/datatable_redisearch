json.extract! physician, :id, :first_name, :last_name, :npi, :address1, :address2, :city, :state, :postal_code, :created_at, :updated_at
json.url physician_url(physician, format: :json)
