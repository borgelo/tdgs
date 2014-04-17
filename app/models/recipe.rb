class Recipe < ActiveRecord::Base
  has_many :re_ins
  belongs_to :meal
end
