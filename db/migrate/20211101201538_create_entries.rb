class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :date
      t.string :mood
      t.string :note 
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
