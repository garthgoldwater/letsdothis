class RemoveMessageParentFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :message_parent_id
    remove_column :messages, :message_parent_type
  end
end
