class Document < ActiveRecord::Base
  belongs_to :group
  belongs_to :parent_document, class_name: "Document"
  has_many :subdocuments, class_name: "Document", foreign_key: "parent_document_id"
  has_many :messages, dependent: :destroy

  def self.oldest_first
    Document.order(created_at: :asc)
  end
end
