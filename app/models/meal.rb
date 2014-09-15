class Meal < ActiveRecord::Base
  has_many :recipes
  belongs_to :meeting
end
