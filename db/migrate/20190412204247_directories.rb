class Directories < ActiveRecord::Migration[5.0]
  def change
    create_table :directories do |t|
       t.integer :user_id
       t.integer :tip_id
       t.integer :stars
       t.string :comment
    end
  end
end
