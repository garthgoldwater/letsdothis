class Group < ActiveRecord::Base
  belongs_to :document

  validates :name, presence: true, uniqueness: true

  has_secure_password

  def messages
    document.messages
  end
end
