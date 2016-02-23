class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :amount
      t.integer :project_id, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
