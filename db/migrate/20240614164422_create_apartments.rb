class CreateApartments < ActiveRecord::Migration[7.1]
  def change
    create_table :apartments do |t|
      t.string :ref_number
      t.float :price
      t.integer :bedroom_number
      t.integer :bathroom_number
      t.integer :rental_status
      t.references :building, null: false, foreign_key: true

      t.timestamps
    end
  end
end
