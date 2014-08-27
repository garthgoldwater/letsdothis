class AddTitleToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :title, :string, null: false
  end
end
