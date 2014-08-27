class AddDocumentToMessages < ActiveRecord::Migration
  def change
    rename_column :messages, :room_id, :document_id
  end
end
