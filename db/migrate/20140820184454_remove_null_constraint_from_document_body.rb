class RemoveNullConstraintFromDocumentBody < ActiveRecord::Migration
  def change
    change_column :documents, :body, :text, null: true
  end
end
