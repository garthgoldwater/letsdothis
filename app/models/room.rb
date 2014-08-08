class Room < ActiveRecord::Base
  has_secure_password

  has_many :messages, dependent: :destroy
  has_many :top_level_topics, as: :topic_parent, dependent: :destroy, class_name: "topic"
  has_many :topics, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def room
    self
  end
end
