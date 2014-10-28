class FixDataForMeRe < ActiveRecord::Migration
  def change
    execute <<-SQL
      INSERT into me_res(meal_id, recipe_id, recipe_sort_order)
      SELECT meal_id, id, sort_order
      FROM recipes;
    SQL
  end
end
