class ChangeBodyOnRecipe < ActiveRecord::Migration
  def change
    change_column :recipes, :body, :text
  end
  
  def down
    change_column :recipes, :body, :text
  end
end
