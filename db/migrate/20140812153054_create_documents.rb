class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :topic, index: true, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
