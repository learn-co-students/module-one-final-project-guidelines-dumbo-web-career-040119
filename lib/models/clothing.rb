class Clothing < ActiveRecord::Base
  belongs_to :article
  belongs_to :brand

  #chooses a clothing item at random. Supposedly.
  def self.random
    self.all.sample
  end

  #a lookup method that can locate an object based on it's :name attribute
  def self.locate_product(product_name)
    self.find_by(:name => product_name)
  end

  #creates an array of clothings depending on slot
  def self.sort_by_slot(input)
    self.all.select{|clothing| clothing.article.slot == input}
  end

  #creates an array of clothings, depending on slot and transforms them into string names
  def self.slot_sorter(input)
    self.all.select{|clothing| clothing.article.slot == input}.map{|clothing| clothing.name}
  end

end
