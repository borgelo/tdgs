class Meal < ActiveRecord::Base
  has_many :recipes
end
