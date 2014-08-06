class Message < ActiveRecord::Base
  belongs_to :room

  validates :body, presence: true
  validates :handle, presence: true

  def self.oldest_first
    order(created_at: :asc)
  end
end
