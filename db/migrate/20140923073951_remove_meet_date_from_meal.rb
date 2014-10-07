class RemoveMeetDateFromMeal < ActiveRecord::Migration
  def change
    remove_column :meals, :meet_date
  end
end
