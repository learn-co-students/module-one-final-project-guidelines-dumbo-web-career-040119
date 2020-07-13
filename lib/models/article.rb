class Article < ActiveRecord::Base
  has_many :clothings
  has_many :brands, through: :clothings
end
