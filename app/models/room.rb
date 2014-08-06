class Room < ActiveRecord::Base
  has_secure_password

  has_many :messages, dependent: :destroy

  validates :name, presence: true, uniqueness: true, allow_blank: false
end
