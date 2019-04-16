class Clothing < ActiveRecord::Base
  belongs_to :article
  belongs_to :brand

  def self.random
    self.all.sample
  end
end
