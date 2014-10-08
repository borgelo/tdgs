class AddSortOrderToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :sort_order, :int
  end
end
