class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :phone
      t.string :website

      t.timestamps
    end
  end
end
