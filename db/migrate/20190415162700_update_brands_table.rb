class ChangeProductsPrice < ActiveRecord::Migration[5.0]
  def change
      change_table brands do |t|
        t.string :name
        t.string :pricepoint
  end
end
