class Entry < ApplicationRecord
  belongs_to :user
  
  validates :mood, presence: true
  validates :note, presence: true
  


  def serialize
    self.attributes.except("created_at", "updated_at")
  end

  # create method that saves the date parses and saves the date 
end
