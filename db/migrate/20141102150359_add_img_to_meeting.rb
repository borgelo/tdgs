class AddImgToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :img_1, :string
  end
end
