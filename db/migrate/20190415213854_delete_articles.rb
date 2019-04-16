class DeleteArticles < ActiveRecord::Migration[5.0]
    def up
      drop_table :articles
    end

    def down
      fail ActiveRecord::IrreversibleMigration
    end
  end
