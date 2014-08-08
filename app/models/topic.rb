class Topic < ActiveRecord::Base
  belongs_to :room
  belongs_to :topic_parent, polymorphic: true
  has_many :topics, as: :topic_parent, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :topic_parent, presence: true
  validates :room, presence: true
end
