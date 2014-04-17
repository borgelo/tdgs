class ChangeDateFormatInRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :prepare_time 
    remove_column :recipes, :cooking_time
    add_column :recipes, :prepare_hours, :integer
    add_column :recipes, :prepare_minutes, :integer
    add_column :recipes, :cooking_hours, :integer 
    add_column :recipes, :cooking_minutes, :integer
  end
end
