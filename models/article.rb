class Article < ActiveRecord::Base
  has_many :clothing
  has_many :brands, through: :clothing
end
