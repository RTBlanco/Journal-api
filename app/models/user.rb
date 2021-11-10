class User < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true 
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }


  has_many :entries
  has_secure_password

  def serialize
    self.attributes.except("password_digest", "created_at", "updated_at")
  end
end

