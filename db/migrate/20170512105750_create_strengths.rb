class CreateStrengths < ActiveRecord::Migration[5.0]

  def change
    create_table :strengths, id: :uuid do |t|
      t.uuid :router_id 
      t.integer :strength
      t.timestamps
    end
    add_index :strengths, :router_id

  end
end
