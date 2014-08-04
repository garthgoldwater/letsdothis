class CreateHandles < ActiveRecord::Migration
  def change
    create_table :handles do |t|
      t.string :name, null: false
      t.references :room, index: true, null: false

      t.timestamps null: false
    end
    add_index :handles, [:name, :room_id], unique: true
  end
end
