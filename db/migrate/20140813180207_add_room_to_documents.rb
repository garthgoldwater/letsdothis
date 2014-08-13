class AddRoomToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :room, index: true, null: false
  end
end
