class CreateContactForms < ActiveRecord::Migration[7.1]
  def change
    create_table :contact_forms do |t|
      t.references :apartment, null: false, foreign_key: true
      t.string :phone
      t.string :email
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
