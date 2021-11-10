class ChangeColumnToDateInEntries < ActiveRecord::Migration[6.1]
  def change
    change_column :entries, :date, :datetime 
  end
end
