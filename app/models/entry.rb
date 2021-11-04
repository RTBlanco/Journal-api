class Entry < ApplicationRecord
  belongs_to :user

  def serialize
    self.attributes.except("created_at", "updated_at")
  end
end
