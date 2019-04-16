class UpdateClothingsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :clothings, :brand_id, :integer
    add_column :clothings, :article_id, :integer 
  end
end
