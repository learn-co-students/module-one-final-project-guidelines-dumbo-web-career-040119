class Article < ActiveRecord::Base
  has_many :clothing
  has_many :brand through :clothing
end
