class Recipe < ActiveRecord::Base
  has_many :me_res
  has_many :meals, through: :me_res
  has_many :re_ins
  has_many :ingredients, through: :re_ins
  belongs_to :category
  belongs_to :type
  belongs_to :commodity
end
