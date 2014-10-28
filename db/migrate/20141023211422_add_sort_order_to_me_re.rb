class AddSortOrderToMeRe < ActiveRecord::Migration
  def change
    add_column :me_res, :recipe_sort_order, :integer
  end
end
