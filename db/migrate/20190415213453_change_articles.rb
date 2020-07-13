class ChangeArticles < ActiveRecord::Migration[5.0]
  def change
    change_column :articles, :type, :slot
  end
end
