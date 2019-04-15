class Brand < ActiveRecord::Base
  has_many :clothing
  has_many :article through :clothing
end
