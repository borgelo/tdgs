class AddSortOrderToReIn < ActiveRecord::Migration
  def change
    add_column :re_ins, :ingredient_sort_order, :integer
  end
end
