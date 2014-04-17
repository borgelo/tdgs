class AddAmountAndmealidToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :meal_id, :integer
  end
end
