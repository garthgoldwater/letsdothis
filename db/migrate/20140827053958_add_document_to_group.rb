class AddDocumentToGroup < ActiveRecord::Migration
  def change
    add_reference :groups, :document, index: true
  end
end
