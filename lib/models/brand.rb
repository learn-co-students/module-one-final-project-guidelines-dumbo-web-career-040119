class Brand < ActiveRecord::Base
  has_many :clothings
  has_many :articles, through: :clothings

  def self.choose_budget(articles_question)
    brand_pricepoints = self.all.select{|brand| brand.pricepoint == "budget"}
    budget_brands_clothings = brand_pricepoints.map{|brand| brand.clothings}
    budget_brands_clothings.flatten.find{|clothing| clothing.article.slot == articles_question}
  end

  def self.choose_luxury(articles_question)
    brand_pricepoints = self.all.select{|brand| brand.pricepoint == "luxury"}
    luxury_brands_clothings = brand_pricepoints.map{|brand| brand.clothings}
    luxury_brands_clothings.flatten.find{|clothing| clothing.article.slot == articles_question}
  end

  def self.choose_brand(articles_question_input)
    brandname = self.all.select{|brand| brand.name == articles_question_input}
    brandname_list_of_products = brandname.first.clothings
  end

end
