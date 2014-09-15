class AddIngressToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :ingress, :string
  end
end
