class CreateMeRes < ActiveRecord::Migration
  def change
    create_table :me_res do |t|
      t.integer :recipe_id
      t.integer :meal_id

      t.timestamps
    end
  end
end
