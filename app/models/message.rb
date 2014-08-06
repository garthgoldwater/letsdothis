class Message < ActiveRecord::Base
  belongs_to :room

  def self.recent_last
    order(created_at: :asc)
  end
end
