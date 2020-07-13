class DeleteClothes < ActiveRecord::Migration[5.0]
  def up
    drop_table :clothes
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
