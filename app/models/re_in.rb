class ReIn < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  attr_accessor :ingredient_name
end
