class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :title, null: false
      t.references :topic_parent, index: true, null: false, polymorphic: true
      t.references :room, index: true, null: false

      t.timestamps null: false
    end
    add_index :topics, :title, unique: true
  end
end
