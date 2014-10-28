class Meal < ActiveRecord::Base
  has_many :me_res
  has_many :recipes, through: :me_res
  belongs_to :meeting
end
