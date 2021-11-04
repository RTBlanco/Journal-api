class User < ApplicationRecord
  has_many :entries 
  
  has_secure_password

  def serialize
    self.attributes.except("password_digest", "created_at", "updated_at")
  end

end
