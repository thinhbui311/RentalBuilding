class CreateBuildings < ActiveRecord::Migration[7.1]
  def change
    create_table :buildings do |t|
      t.string :name
      t.text :description
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
