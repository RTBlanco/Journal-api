require "time"

class Entry < ApplicationRecord
  #TODO: want to save it in the database as a date time instead! 
  belongs_to :user
  
  validates :mood, presence: true
  validates :note, presence: true
  validates :date, presence: true, format: {
    with: /\d{4}\-\d{2}\-\d{2}/,
    message: "Date is incorrect format yyyy-mm-dd"
  }

  def serialize
    self.attributes.except("created_at", "updated_at")
  end

end
