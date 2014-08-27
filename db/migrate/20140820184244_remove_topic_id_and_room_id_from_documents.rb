class RemoveTopicIdAndRoomIdFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :topic_id
    remove_column :documents, :room_id
  end
end
