class AddPluralToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :plural, :string
  end
end
