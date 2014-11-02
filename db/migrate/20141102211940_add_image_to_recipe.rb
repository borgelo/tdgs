class AddImageToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :img_1, :string
  end
end
