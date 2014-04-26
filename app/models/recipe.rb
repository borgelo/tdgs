class Recipe < ActiveRecord::Base
  has_many :re_ins
  belongs_to :meal
  belongs_to :category
  belongs_to :type
  belongs_to :commodity
end
