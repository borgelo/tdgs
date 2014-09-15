class AddMealRefToDishes < ActiveRecord::Migration
  def change
    add_reference :dishes, :meal, index: true
  end
end
