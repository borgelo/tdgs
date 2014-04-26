class AddCommodityToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :commodity_id, :integer
  end
end
