class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, unique: true, null: false
      t.string :password_digest, null: false
      t.boolean :private, null: false, default: true
      t.timestamps
    end
  end
end
