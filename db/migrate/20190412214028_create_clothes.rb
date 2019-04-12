class CreateClothes < ActiveRecord::Migration[5.0]
  def change
    create_table clothes do |t|
      t.string :name
      t.string :material
      t.float :price
  end
end
