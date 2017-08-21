class DelColumnDate < ActiveRecord::Migration[5.1]
  def change
    remove_column :news_items, :date
  end
end
