class Document < ActiveRecord::Base
  belongs_to :topic
  belongs_to :room


  def self.oldest_first
    Document.order(created_at: :asc)
  end
end
