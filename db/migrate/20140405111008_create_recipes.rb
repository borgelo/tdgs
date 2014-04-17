class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :ingress
      t.string :body
      t.datetime :prepare_time
      t.datetime :cooking_time
      t.integer :servings

      t.timestamps
    end
  end
end
