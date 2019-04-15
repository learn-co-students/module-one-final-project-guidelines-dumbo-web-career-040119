class CreateClothings < ActiveRecord::Migration[5.0]
    def change
      create_table :clothings do |t|
        t.string :name
        t.string :material
        t.float :price
    end
  end
end
