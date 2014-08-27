class Message < ActiveRecord::Base
  belongs_to :document

  validates :body, presence: true
  validates :handle, presence: true
  validates :document, presence: true

  delegate :group, to: :document

  def self.oldest_first
    order(created_at: :asc)
  end
end
