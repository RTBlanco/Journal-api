class Entry < ApplicationRecord
  attr_reader :date

  belongs_to :user
  
  validates :mood, presence: true
  validates :note, presence: true
  validates :date, presence: true, format: {
    with: /\d{4}\-\d{2}\-\d{2}/,
    strict: true,
    message: "Date is incorrect format yyyy-mm-dd"
  }
  


  def serialize
    self.attributes.except("created_at", "updated_at")
  end

  # create method that saves the date parses and saves the date 
  def date
    #date will come in as 2021-10-10
    #needs to return a date object

    self.date.to_time
  
  end

end
