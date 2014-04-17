class CreateReIns < ActiveRecord::Migration
  def change
    create_table :re_ins do |t|
      t.integer :recipe_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
