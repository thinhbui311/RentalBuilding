class CreatePolicies < ActiveRecord::Migration[7.1]
  def change
    create_table :policies do |t|
      t.integer :policy_type
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
