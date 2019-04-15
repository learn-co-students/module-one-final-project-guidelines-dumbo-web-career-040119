class Clothing < ActiveRecord::Base
  belongs_to :article
  belongs_to :brand
end
