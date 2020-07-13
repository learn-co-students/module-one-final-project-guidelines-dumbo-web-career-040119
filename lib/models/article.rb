class Article < ActiveRecord::Base
  has_many :clothings
  has_many :brands, through: :clothings

  # def self.choose_slot(suggestion, articles_question_input)
  #   dummy = suggestion.select{|brand| brand.clothings.}
  #   binding.pry
  #   0
  # end

end
