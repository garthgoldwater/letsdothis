class AddDocumentsToGroups < ActiveRecord::Migration
  def change
    add_reference :documents, :group, index: true, null: false
  end
end
