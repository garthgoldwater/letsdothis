class Room < ActiveRecord::Base
  has_secure_password

  has_many :messages

  validates :name, presence: true, uniqueness: true
end
