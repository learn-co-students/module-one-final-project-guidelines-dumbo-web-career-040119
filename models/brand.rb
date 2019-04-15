class brand < ActiveRecord::Base

  def choose_price_case(type)
    self.all.select{|brand| brand.pricepoint == "budget"}.find{|brand| brand.clothes.articles == type}
  end

end
