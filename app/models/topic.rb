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

  def display_document
    document || "documents/nil_document"
  end
end
