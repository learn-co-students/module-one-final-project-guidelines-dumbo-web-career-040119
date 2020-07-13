class Brand < ActiveRecord::Base
  has_many :clothings
  has_many :articles, through: :clothings

  
  def self.choose_budget_array(input)
    brand_pricepoints = self.all.select{|brand| brand.pricepoint == "budget"}
    budget_brands_clothings = brand_pricepoints.map{|brand| brand.clothings}
  end

  def self.choose_budget(articles_question)
    brand_pricepoints = self.all.select{|brand| brand.pricepoint == "budget"}
    budget_brands_clothings = brand_pricepoints.map{|brand| brand.clothings}
    budget_brands_clothings.flatten.select{|clothing| clothing.article.slot == articles_question}.sample
  end

  def self.choose_luxury(articles_question)
    brand_pricepoints = self.all.select{|brand| brand.pricepoint == "luxury"}
    luxury_brands_clothings = brand_pricepoints.map{|brand| brand.clothings}
    luxury_brands_clothings.flatten.select{|clothing| clothing.article.slot == articles_question}.sample
  end

  def self.choose_brand(articles_question_input)
    brandname = self.all.find{|brand| brand.name == articles_question_input}
    # binding.pry
    brandname_list_of_products = brandname.clothings.sample
    # 0
  end

  def self.choose_brand_items(input)
    brandname = self.all.select{|brand| brand.name == input}
    brandname_list_of_products = brandname.first.clothings
    test = brandname_list_of_products.map{|clothing| clothing.name}
    # binding.pry
    # 0
  end



end
