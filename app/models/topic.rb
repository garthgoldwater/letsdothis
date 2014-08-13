class Topic < ActiveRecord::Base
  belongs_to :room
  belongs_to :topic_parent, polymorphic: true
  has_many :topics, as: :topic_parent, dependent: :destroy
  has_many :messages, as: :message_parent, dependent: :destroy
  has_one :document

  validates :title, presence: true, uniqueness: true
  validates :topic_parent, presence: true
  validates :room, presence: true

  def parent
    topic_parent
  end

  def self.documents
    Document.where(topic_ids: topic_ids).order(created_at: :asc)
  end

  def compile_document
    document + topics.compile_documents
  end

  def self.compile_documents
    subtopics = topics.where(topic_parent_id: topic_id).order(created_at: :asc)
    subtopics.each do |topic|
      topic.compile_document
    end
  end
end
