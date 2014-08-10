class Message < ActiveRecord::Base
  belongs_to :room
  belongs_to :message_parent, polymorphic: true

  validates :body, presence: true
  validates :handle, presence: true
  validates :room, presence: true
  validates :message_parent, presence: true

  def self.oldest_first
    order(created_at: :asc)
  end
end
