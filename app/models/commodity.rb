class Commodity < ActiveRecord::Base
  has_many :recipe
end
