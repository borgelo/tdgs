class AddDateToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :meet_date, :date
  end
end
