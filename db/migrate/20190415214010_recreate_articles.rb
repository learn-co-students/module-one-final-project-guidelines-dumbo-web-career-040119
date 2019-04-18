class RecreateArticles < ActiveRecord::Migration[5.0]
  #represents the type of clothing such as pants, shoes, hoodies, etc.
    def change
      create_table :articles do |t|
        t.string :slot
      end
    end
  end
