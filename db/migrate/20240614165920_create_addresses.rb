class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :street_number
      t.string :street_name
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.float :latitude, index: true
      t.float :longitude, index: true
      t.references :addressable, polymorphic: true

      t.timestamps
    end
  end
end
