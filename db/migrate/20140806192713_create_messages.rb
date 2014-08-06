class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :room, index: true, null: false
      t.text :body, null: false
      t.string :handle, null: false

      t.timestamps null: false
    end
    add_index :messages, :handle
  end
end
