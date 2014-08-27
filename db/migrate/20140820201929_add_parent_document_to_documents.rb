class AddParentDocumentToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :parent_document, index: true, null: true
  end
end
