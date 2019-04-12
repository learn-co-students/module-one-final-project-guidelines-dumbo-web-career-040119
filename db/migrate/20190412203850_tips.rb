class Tips < ActiveRecord::Migration[5.0]
  def change
    create_table :tips do |t|
      t.string :type
      t.string :content
      t.boolean :experience_level
      t.timestamps
    end
  end
end
