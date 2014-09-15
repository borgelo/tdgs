class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :name
      t.date :meet_date

      t.timestamps
    end
  end
end
