class CreateGroups < ActiveRecord::Migration
  def change
    rename_table :rooms, :groups
  end
end
