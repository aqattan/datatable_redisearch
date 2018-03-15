class CreatePhysicians < ActiveRecord::Migration[5.1]
  def change
    create_table :physicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :npi
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :postal_code

      t.timestamps
    end
  end
end
