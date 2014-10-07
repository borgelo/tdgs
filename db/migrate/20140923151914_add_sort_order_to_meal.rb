class AddSortOrderToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :sort_order, :int
  end
end
