class AddImageToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :img_1, :string
  end
end
