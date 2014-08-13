class Room < ActiveRecord::Base
  has_secure_password

  has_many :messages, dependent: :destroy
  has_many :top_level_messages, as: :message_parent, dependent: :destroy, class_name: "Message"
  has_many :topics, dependent: :destroy
  has_many :top_level_topics, as: :topic_parent, dependent: :destroy, class_name: "Topic"
  has_many :documents

  validates :name, presence: true, uniqueness: true

  def room
    self
  end

  def parent; end

  def document
    collect_top_level_documents
    j
  end

  private

  def collect_top_level_documents
    top_level_topics.documents
  end
end
