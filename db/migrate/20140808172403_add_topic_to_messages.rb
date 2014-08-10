class AddTopicToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :message_parent, index: true, null: false, polymorphic: true
  end
end
