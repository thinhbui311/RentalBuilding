class CreateBuildingPolicies < ActiveRecord::Migration[7.1]
  def change
    create_table :building_policies do |t|
      t.references :building, null: false, foreign_key: true
      t.references :policy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
