class ChangeAmountToDecimal < ActiveRecord::Migration
  def change
    change_column :re_ins, :amount, :decimal
  end
  
  def down
   change_column :re_ins, :amount, :integer
  end
end
