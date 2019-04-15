#represents the branding of the clothes, e.g, Nike, Puma, Adidas, etc.

class CreateBrand < ActiveRecord::Migration[5.0]
  def change
    create_table brands do |t|
      t.string :name
  end
end
