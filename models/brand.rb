class Brand < ActiveRecord::Base
  has_many :clothing
  has_many :articles, through: :clothing

  def choose_budget(type)
    Brand.all.select{|brand| brand.pricepoint == "budget"}.find{|brand| brand.clothes.articles == type}
  end

end
