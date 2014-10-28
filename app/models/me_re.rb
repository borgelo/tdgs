class MeRe < ActiveRecord::Base
  belongs_to :meal
  belongs_to :recipe
end
