class AddMeetingToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :meeting_id, :integer
  end
end
