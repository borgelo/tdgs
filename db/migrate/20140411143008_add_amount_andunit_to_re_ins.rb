class AddAmountAndunitToReIns < ActiveRecord::Migration
  def change
    add_column :re_ins, :amount, :integer
    add_column :re_ins, :unit, :string
  end
end
