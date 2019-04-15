#represents the actual product that the customer would be choosing

class CreateClothes < ActiveRecord::Migration[5.0]
  def change
    create_table clothes do |t|
      t.string :name
      t.string :material
      t.float :price
  end

  def select_cheapest #satisfies User Story #1
    choice = Article.new
  end
end
