class FixTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :news_actions, :news_items
  end
end
