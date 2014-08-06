class Message < ActiveRecord::Base
  belongs_to :room
  validates :body, presence: true, allow_blank: false
  validates :handle, presence: true, allow_blank: false

  def self.oldest_first
    order(created_at: :asc)
  end
end
