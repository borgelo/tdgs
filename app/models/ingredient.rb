class Ingredient < ActiveRecord::Base
  has_many :re_ins
  has_many :recipes, through: :re_ins
end
