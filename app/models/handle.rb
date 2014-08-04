class Handle < ActiveRecord::Base
  belongs_to :room

  validates :name, :room, presence: true
end
